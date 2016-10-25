-- AI Gibraltar
-- ========================================================================
--  PROGRAME SEU USO DE HABILIDADES
-- ========================================================================
---------------------------------------------------------------------------
function GetAndUseBestSkill()
--------------------------------------------------------------------------- 			
	--  Se uma habilidade de combo deve ser usada, use-a e ignore as outras.
	if (MyNextSkill > 0) then
		if (GetTick() > MyNextSkillTimer or MyNextSkillTimer <= 0) then
			Log("usando habilidade sequencial: "..MyNextSkill)
			
			local range = SkillRange(MyID, MyNextSkill, MyNextSkillLevel)
			local distance;
			local usedCombo = false
			if (MyNextSkillTarget > 0) then
				distance = GetDistance2(MyID, MyNextSkillTarget)
				if (distance <= range) then
					usedCombo = true
					UseSkill(MyID, MyNextSkillLevel, MyNextSkill, MyNextSkillTarget);
				end
			elseif (MyNextSkillX >= 0) then
				distance = GetDistance(MyX, MyY, MyNextSkillX, MyNextSkillY)
				if (distance <= range) then
					usedCombo = true
					UseAreaSkill(MyID, MyNextSkillLevel, MyNextSkill, MyNextSkillX, MyNextSkillY) 
				end
			end
			MyNextSkill                 = 0
			MyNextSkillTimer            = 0  --  
			MyNextSkillLevel            = 0
			MyNextSkillTarget           = 0
			MyNextSkillX                = 0
			MyNextSkillY                = 0
			if (usedCombo) then
				return
			end
		end
	end
	--  Se a porcentagem de SP não for suficiente (50%), ignora as habilidades e retorna ("return") para resto da AI funcionar.
	--  Somente cancela se meu HP também for maior que 80% e o do mestre for maior que 80%...
	
	local playerEnemyDanger = false;
	if (MyEnemy > 0) then
		if (IsPlayer(MyEnemy)) then
			playerEnemyDanger = true
		end
	end
	
	MySPToBuff = 55
	if MySPPerc < 50 and MyHPPerc >= MyEvadeHPPerc and OwnerHPPerc >= MyEvadeHPPerc and not playerEnemyDanger then 
		return;  
	elseif (MyHPPerc < MyEvadeHPPerc or OwnerHPPerc < MyEvadeHPPerc or playerEnemyDanger) then
		MySPToBuff = 25
	end
	if MySPPerc < 20 then
		return; end 
		
	local skill, level, target, slot, x, y = GetBestSkill()
	if (skill == 0) then return; end;
	 
	if (target > 0) then
		UseSkill(MyID, level, skill, target);
	elseif (x >= 0) then
		UseAreaSkill(MyID, level, skill, x, y) 
	end
end
---------------------------------------------------------------------------
--  Aqui é o uso de habilidades (combo) APÓS o uso da habilidade anterior ("skill" com valor positivo) ou determinada situação (valor negativo)
-- Mais abaixo está a função de usos de habilidades comum (GetBestSkill).
-----------------------------
function GetBestCombo(skill, level, target, x, y)
--------------------------------------------------------------------------- 
	local nextSkill = 0; local timer = 0;
	
	if (skill < 0) then
		local i = -1
		--  Usar habilidades prioritárias em cada estado (valor do estado = -(skill + 1000))
		if         (skill <= -1000) then
			local state = -(skill + 1000)
			if state == CHASE_ST then
				local enemyType = GetTypeFromID(target)
				if (IsPlayer(target) 
				or (enemyType >= 1  and enemyType <= 16)
				or (enemyType >= 48 and enemyType <= 52)
				) then
					--  BRISA DA CALMARIA
					if (UseEiraSilentBreeze and IsAvailable(8026)) then
						i = GetSlotOfSkill(8026);
						if (GetTick() > Skills[Available[i].Skill].Reuse) then
							nextSkill = 8026; timer = 1000;
						end
					end
				end
			end
		--  Usar habilidades emergenciais para um inimigo que acabou de sair de furtividade ou esconderijo (valor -2)
		elseif     (skill == -2) then
			--  CONVOCAÇÃO
			if (UseSeraSummonLegion and IsAvailable(8018)) then
				i = GetSlotOfSkill(8018);
				if (GetTick() > Skills[Available[i].Skill].Reuse) then
					nextSkill = 8018; timer = 1000;
				end
			end
			--  BRISA DA CALMARIA
			if (IsAvailable(8026)) then
				i = GetSlotOfSkill(8026);
				if (GetTick() > Skills[Available[i].Skill].Reuse) then
					nextSkill = 8026; timer = 1000;
				end
			end
			--  IMPACTO PRECISO
			if (IsAvailable(8031)) then
				i = GetSlotOfSkill(8031);
				if (GetTick() > Skills[Available[i].Skill].Reuse) then
					nextSkill = 8031; timer = 1000;
				end
			end
			--  QUEBRA-COSTELAS
			if (UseEleanorTinderBreaker and IsAvailable(8036)) then
				i = GetSlotOfSkill(8036);
				if (GetTick() > Skills[Available[i].Skill].Reuse) then
					nextSkill = 8036; timer = 1000;
				end
			end
		--  Usar habilidades emergenciais do estado DESESPERO (valor -1)
		elseif (skill == -1 and MyState == EVADE_ST) then
			Log("desespero! Usar habilidades. Contagem: "..level)
			if (level == 0 or (nextSkill == 0 and level <= 0)) then
				--  INUNDAÇÃO DE MAGMA
				if (IsAvailable(8039)) then
					i = GetSlotOfSkill(8039);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8039; timer = 1000;
						target = MyID
					end
				end
				--  ESQUIVA ESPECIAL
				if (IsAvailable(8023)) then
					i = GetSlotOfSkill(8023);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						if (OwnerAFK) then
							nextSkill = 8023; timer = 1000;
							target = MyID
						end
					end
				end
				--  CONVOCAÇÃO
				if (UseSeraSummonLegion and IsAvailable(8018)) then
					i = GetSlotOfSkill(8018);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8018; timer = 1000;
					end
				end
				--  RAIVA ILUMINADA
				if (IsAvailable(8035)) then
					i = GetSlotOfSkill(8035);
					local okToUse = false
					if (not IsAvailable(8032)) then
						okToUse = true;
					else
						local iConflict = GetSlotOfSkill(8032);
						if (GetTick() > Skills[Available[iConflict].Skill].Reuse) then
							okToUse = true;
						end
					end
					if (okToUse and MyHPPerc <= 25) then
						if (GetTick() > Skills[Available[i].Skill].Reuse) then
							nextSkill = 8035; timer = 1000;
							target = MyID
						end
					end
				end
			end
				
				
				
			if (level == 1 or (nextSkill == 0 and level <= 1)) then
				--  ARMADURA DE GRANITO
				if (IsAvailable(8040)) then
					i = GetSlotOfSkill(8040);
					if (OwnerHPPerc >= 50 and MyHPPerc >= 50 and OwnerAFK) then
						if (GetTick() > Skills[Available[i].Skill].Reuse) then
							nextSkill = 8040; timer = 1000;
							target = MyID
						end
					end
				end
				--  PONTO DE PARALISIA
				if (IsAvailable(8019)) then
					i = GetSlotOfSkill(8019);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8019; timer = 1000;
					end
				end
				--  BRISA DA CALMARIA
				if (IsAvailable(8026)) then
					i = GetSlotOfSkill(8026);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8026; timer = 1000;
					end
				end
				--  IMPACTO PRECISO
				if (IsAvailable(8031)) then
					i = GetSlotOfSkill(8031);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8031; timer = 1000;
					end
				end
			end
				
				
				
			if (level == 2 or (nextSkill == 0 and level <= 2)) then
				--  TREMOR DE FOGO
				if (IsAvailable(8042)) then
					i = GetSlotOfSkill(8042);
					if (OwnerAFK) then
						if (GetTick() > Skills[Available[i].Skill].Reuse) then
							nextSkill = 8042; timer = 1000;
							target = MyID
						end
					end
				end
				--  NÉVOA VENENOSA
				if (IsAvailable(8020)) then
					i = GetSlotOfSkill(8020);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8020; timer = 1000;
						target = 0
					end
				end
				--  CHOQUE SUPERSÔNICO
				if (IsAvailable(8024)) then
					i = GetSlotOfSkill(8024);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8024; timer = 1000;
					end
				end
				--  ILLUMINATUS
				if (IsAvailable(8034)) then
					i = GetSlotOfSkill(8034);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8034; timer = 1000;
					end
				end
			end
				
				
				
			if (level == 3 or (nextSkill == 0 and level <= 3)) then
				--  LUZ SALVADORA
				if (IsAvailable(8033)) then
					i = GetSlotOfSkill(8033);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8033; timer = 1000;
						target = MyID
					end
				end
				--  DERRETIMENTO COM LAVA
				if (IsAvailable(8041)) then
					i = GetSlotOfSkill(8041);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8041; timer = 1000;
						target = 0
					end
				end
				--  ONDA SUPERSÔNICA
				if (IsAvailable(8025)) then
					i = GetSlotOfSkill(8025);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8025; timer = 1000;
						target = 0
					end
				end
			end
				
				
				
			if (level == 4 or (nextSkill == 0 and level <= 4)) then
				--  BÊNÇÃO CAÓTICA
				if (UseCaprice and IsAvailable(8014)) then
					i = GetSlotOfSkill(8014);
					if (GetTick() > Skills[Available[i].Skill].Reuse) then
						nextSkill = 8014; timer = 1000;
						target = MyID
					end
				end
				
				
				
			end
		end
		if (i > 0) then
			level = Available[i].Level;
			if (nextSkill == 8024 or nextSkill == 8025) then
				if (level > 1 and math.random(1, 100) <= 50) then
					level = 1;
					if     math.random(1, 100) <= 40 then level = 2;
					elseif math.random(1, 100) <= 30 then level = 3;
					elseif math.random(1, 100) <= 20 then level = 4;
					elseif math.random(1, 100) <= 10 then level = 5; end
				elseif (level > 4) then
					if     math.random(1, 100) <= 40 then level = 4;
					elseif math.random(1, 100) <= 30 then level = 3;
					elseif math.random(1, 100) <= 20 then level = 2;
					elseif math.random(1, 100) <= 10 then level = 1; end
				end
			end
			local minSP = Skills[Available[i].Skill].MinSP[level]
			
			local range = SkillRange(MyID, skill, level)
			local distance;
			if (target > 0) then
				distance = GetDistance2(MyID, target)
			else
				distance = GetDistance(MyX, MyY, x, y)
			end
				
			if (distance > range) then
				nextSkill = 0;
			elseif (minSP ~= nil) then
				if (MySP < minSP) then
					nextSkill = 0;
				end
			end
		end
	end
	
	if (skill == 8035) then 
		nextSkill = 8035; timer = 1000;
	
	elseif MySPPerc >= 20 and (MySPPerc >= 50 or (MyHPPerc < MyEvadeHPPerc or OwnerHPPerc < MyEvadeHPPerc or playerEnemyDanger)) then 
		if     (skill == 8028 and math.random(1, 100) <= 70 ) then nextSkill = 8028; timer = 500;
		elseif (skill == 8030 and math.random(1, 100) <= 90 ) then nextSkill = 8028; timer = 1000;
		elseif (skill == 8038 and math.random(1, 100) <= 90 ) then nextSkill = 8036; timer = 1000;
		
		elseif (skill == 8036 and math.random(1, 100) <= 100) then nextSkill = 8037; timer = 1000;
		elseif (skill == 8037 and math.random(1, 100) <= 100) then nextSkill = 8038; timer = 1000;
		elseif (skill == 8028 and math.random(1, 100) <= 95 ) then nextSkill = 8029; timer = 1000;
		elseif (skill == 8029 and math.random(1, 100) <= 100) then nextSkill = 8030; timer = 1000; 
		
		elseif (skill == 8005 and NeedsCastling > 0) then
			nextSkill = 8005; timer = 1000; 
		end
	end;
	if (nextSkill > 0 and IsAvailable(nextSkill)) then 
		local i = GetSlotOfSkill(nextSkill);
		if (target == 0 or not IsOutOfSight(GetV(V_TARGET, target), target)) then
			MyNextSkill                 = nextSkill; 
			MyNextSkillTimer            = GetTick() + timer  --  
			MyNextSkillLevel            = Available[i].Level
			MyNextSkillTarget           = target
			MyNextSkillX                = x
			MyNextSkillY                = y
		end
	end
end
---------------------------------------------------------------------------
function GetBestSkill()
---------------------------------------------------------------------------
	local skill = 0; 
	local level = 0; local target = 0;
	local x, y = -1, -1;
	
	local slot = 1; 
	
	local friend; local enemyType;
	-- local count = 1
	for i = 1, Total, 1 do
		if (Skills[Available[i].Skill]) then
			if (skill == 0 or i >= Round) then
				
				local lastSkill = skill
				local lastLevel	= level 
				local lastTarget = target;
				local lastX, lastY = x, y
				local lastSlot = slot
				-- ========================================================================
				--  HOMUNCULUS
				-- ========================================================================
				if Homun then
					if     (MyState == IDLE_ST  ) then
						
						--  TROCA DE LUGAR
						if (8005 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) 
						then
							if (MyDestX == MyX and MyDestY == MyY)
							and TravelCastle
							then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyID
								slot = i;
							end
						end
						
						--  BÊNÇÃO CAÓTICA
						if (UseCaprice and 8014 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (MyHPPerc < 80 or OwnerHPPerc < 80) and math.random(1, 100) <= 50 then
								skill = Available[i].Skill;
								level = Available[i].Level;
								if     math.random(1, 100) <= 40 then level = 4;
								elseif math.random(1, 100) <= 30 then level = 3;
								elseif math.random(1, 100) <= 20 then level = 2;
								elseif math.random(1, 100) <= 10 then level = 1; end
								target = MyID
								slot = i;
							end
						end
						
						--  CONVOCAÇÃO
						if (UseSeraSummonLegion and 8018 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyInvisibleEnemy
							slot = i;
						end
						
						--  NÉVOA VENENOSA
						if (UseSeraPoisonMist and 8020 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (MyHPPerc >= MyAggroHPPerc) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								if (GetDistance2(MyID, OwnerID) >= 2) then
									target = MyID
								else
									target = OwnerID
								end
								local tX, tY = GetV(V_POSITION, target); 
								target = 0
								x, y = tX, tY
								slot = i;
							end
						end
						
						--  ANALGÉSICO
						if (8021 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = OwnerID
							slot = i;
						end
						if (8021 == Available[i].Skill) then
							local tryFriend = false;
							if (target == 0) then
								tryFriend = true;
							elseif (skill == Available[i].Skill and target > 0) then
								local dis = GetDistance2(MyID, target)
								local ran = SkillRange(MyID, skill, level)
								if (dis > ran) then
									tryFriend = true;
								end
							end		
							if (tryFriend) then
								friend = GetFriendToHeal(skill, Available[i].Level)
								if (friend > 0) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = friend
									slot = i;
								end
							end
						end
						
						--  FÚRIA ILUMINADA
						if (8032 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						--  LUZ SALVADORA
						if (8033 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						--  INUNDAÇÃO DE MAGMA
						if (8039 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						--  DERRETIMENTO COM LAVA
						if (8041 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (MyHPPerc >= MyAggroHPPerc) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								if (GetDistance2(MyID, OwnerID) >= 2) then
									target = MyID
								else
									target = OwnerID
								end
								local tX, tY = GetV(V_POSITION, target); 
								target = 0
								x, y = tX, tY
								slot = i;
							end
						end
						
						--  CINZAS VULCÂNICAS
						if (8043 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (math.random(1, 100) <= 20) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = OwnerID
								local tX, tY = GetV(V_POSITION, target); 
								if math.random(1, 100) <= 50 then tX = tX + math.random(2, MaxDistance); else tX = tX - math.random(2, MaxDistance); end
								if math.random(1, 100) <= 50 then tY = tY + math.random(2, MaxDistance); else tY = tY - math.random(2, MaxDistance); end
								target = 0
								x, y = tX, tY
								slot = i;
							end
						end
						
						--  BRISA DA CALMARIA
						if (UseEiraSilentBreeze and 8026 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerMotion == MOTION_SIT) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = OwnerID
								slot = i;							
							end
						end
						if (8026 == Available[i].Skill) then
							local tryFriend = false;
							if (target == 0) then
								tryFriend = true;
							elseif (skill == Available[i].Skill and target > 0) then
								local dis = GetDistance2(MyID, target)
								local ran = SkillRange(MyID, skill, level)
								if (dis > ran) then
									tryFriend = true;
								end
							end		
							if (tryFriend) then
								friend = GetFriendToHeal(skill, Available[i].Level)
								if (friend > 0) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = friend
									slot = i;
								end
							end
						end
						
						
						
					elseif (MyState == FOLLOW_ST) then
						
						-- ========================================================================
						--  LIF
						-- ========================================================================
						if (Homun == LIF or Homun == LIF_H or Homun == LIF2 or Homun == LIF_H2) 
						or (AutoSkills == 2  
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  BATER EM RETIRADA
							if (8002 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						
						
					elseif (MyState == CHASE_ST ) then
						
						if (AutoSkills ~= 2 or not OwnerAFK or MySPPerc > MySPToBuff) then
							-- ========================================================================
							--  OFENSIVAS GERAIS
							-- ========================================================================
							--  TROCA DE LUGAR
							if (8005 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (CountEnemiesCloseTo(MyID) <= CountEnemiesCloseTo(OwnerID)) and math.random(1, 100) <= 80 
								and OwnerMotion ~= MOTION_HIT and (LastOwnerMotion == MOTION_HIT or WasHitCastling)
								and GetDistance2(OwnerID, MyID) <= 1
								then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  CAPRICHO
							if (UseCaprice and 8013 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and not IsOutOfSight(GetV(V_TARGET, MySecondaryEnemy), MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end

							--  BÊNÇÃO CAÓTICA
							if (UseCaprice and 8014 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (MyHPPerc < 80 or OwnerHPPerc < 80) and math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									if     math.random(1, 100) <= 40 then level = 4;
									elseif math.random(1, 100) <= 30 then level = 3;
									elseif math.random(1, 100) <= 20 then level = 2;
									elseif math.random(1, 100) <= 10 then level = 1; end
									target = MyID
									slot = i;
								end
							end
							
							--  CONVOCAÇÃO
							if (UseSeraSummonLegion and 8018 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								slot = i;
							end
							
							--  PONTO DE PARALISIA
							if (UseSeraParalyze and 8019 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								slot = i;
							end
							
							--  NÉVOA VENENOSA
							if (UseSeraPoisonMist and 8020 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (LongRangeShooter or MyHPPerc < MyEvadeHPPerc) then
									if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
											if (LongRangeShooter) then
												target = MyID
												tX, tY = GetV(V_POSITION, target);
											end
										end
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
							
							--  ANALGÉSICO
							if (8021 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = OwnerID
								slot = i;
							end
							
							--  CHOQUE SUPERSÔNICO
							if (UseEiraEraseCutter and 8024 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								slot = i;
							end
							
							--  QUEBRA-COSTELAS
							if (UseEleanorTinderBreaker and 8036 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse and MyStyle == STYLE_GRAPP) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
							
							--  IMPACTO PRECISO
							if (UseBayeriStahlHorn and 8031 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								slot = i;
							end
							
							--  DERRETIMENTO COM LAVA
							if (8041 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (LongRangeShooter or MyHPPerc < MyEvadeHPPerc) then
									if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
											if (LongRangeShooter) then
												target = MyID
												tX, tY = GetV(V_POSITION, target);
											end
										end
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
						end
						
						--  ESQUIVA ESPECIAL
						if (8023 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerAFK and 
							AutoSnipes ~= 2) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  LIF
						-- ========================================================================
						if (Homun == LIF or Homun == LIF_H or Homun == LIF2 or Homun == LIF_H2) 
						or (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  BATER EM RETIRADA
							if (8002 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 25 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						
						
					elseif (MyState == ATTACK_ST) then
						
						if (AutoSkills ~= 2 or not OwnerAFK or MySPPerc > MySPToBuff) then
							-- ========================================================================
							--  OFENSIVAS GERAIS
							-- ========================================================================
							--  TROCA DE LUGAR
							if (8005 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (CountEnemiesCloseTo(MyID) <= CountEnemiesCloseTo(OwnerID)) and math.random(1, 100) <= 80 
								and OwnerMotion ~= MOTION_HIT and (LastOwnerMotion == MOTION_HIT or WasHitCastling)
								and GetDistance2(OwnerID, MyID) <= 1
								then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  PICA-PAU
							if (8009 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) 
							and not UseEleanorTinderBreaker
							then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
							
							--  CAPRICHO
							if (UseCaprice and 8013 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (Homun ~= ELEANOR) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  BÊNÇÃO CAÓTICA
							if (UseCaprice and 8014 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (Homun ~= ELEANOR) then
									if (MyHPPerc < 80 or OwnerHPPerc < 80) and math.random(1, 100) <= 50 then
										skill = Available[i].Skill;
										level = Available[i].Level;
										if     math.random(1, 100) <= 40 then level = 4;
										elseif math.random(1, 100) <= 30 then level = 3;
										elseif math.random(1, 100) <= 20 then level = 2;
										elseif math.random(1, 100) <= 10 then level = 1; end
										target = MyID
										slot = i;
									end
								end
							end
							
							--  CONVOCAÇÃO
							if (UseSeraSummonLegion and 8018 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  PONTO DE PARALISIA
							if (UseSeraParalyze and 8019 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  NÉVOA VENENOSA
							if (UseSeraPoisonMist and 8020 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
											if (LongRangeShooter) then
												target = MyID
												tX, tY = GetV(V_POSITION, target);
											end
										end
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
							
							--  CHOQUE SUPERSÔNICO
							if (UseEiraEraseCutter and 8024 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									if (level > 1 and math.random(1, 100) <= 50) then
										level = 1;
										if     math.random(1, 100) <= 40 then level = 2;
										elseif math.random(1, 100) <= 30 then level = 3;
										elseif math.random(1, 100) <= 20 then level = 4;
										elseif math.random(1, 100) <= 10 then level = 5; end
									elseif (level > 4) then
										if     math.random(1, 100) <= 40 then level = 4;
										elseif math.random(1, 100) <= 30 then level = 3;
										elseif math.random(1, 100) <= 20 then level = 2;
										elseif math.random(1, 100) <= 10 then level = 1; end
									end
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  ONDA SUPERSÔNICA
							if (UseEiraXenoSlasher and 8025 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									if (CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										if (level > 1 and math.random(1, 100) <= 50) then
											level = 1;
											if     math.random(1, 100) <= 40 then level = 2;
											elseif math.random(1, 100) <= 30 then level = 3;
											elseif math.random(1, 100) <= 20 then level = 4;
											elseif math.random(1, 100) <= 10 then level = 5; end
										elseif (level > 4) then
											if     math.random(1, 100) <= 40 then level = 4;
											elseif math.random(1, 100) <= 30 then level = 3;
											elseif math.random(1, 100) <= 20 then level = 2;
											elseif math.random(1, 100) <= 10 then level = 1; end
										end
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
							
							--  BRISA DA CALMARIA
							if (UseEiraSilentBreeze and 8026 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  GARRA SUPERSÔNICA
							if (8028 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse and MyStyle == STYLE_FIGHT) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
							
							--  QUEBRA-COSTELAS
							if (UseEleanorTinderBreaker and 8036 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse and MyStyle == STYLE_GRAPP) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  IMPACTO PRECISO
							if (UseBayeriStahlHorn and 8031 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  FÚRIA ILUMINADA
							if (8032 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  LUZ SALVADORA
							if (8033 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  ILLUMINATUS
							if (UseBayeriHailegeStar and 8034 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
										if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
										and (
										(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
										or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
										)
										and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
											target = MySecondaryEnemy
										end
									end
									slot = i;
								end
							end
							
							--  INUNDAÇÃO DE MAGMA
							if (8039 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
								
							--  DERRETIMENTO COM LAVA
							if (8041 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
											if (LongRangeShooter) then
												target = MyID
												tX, tY = GetV(V_POSITION, target);
											end
										end
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
							
							--  CINZAS VULCÂNICAS
							if (8043 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if (math.random(1, 100) <= 20) then
									if (not IsPlayer(MyEnemy) 
									or (OwnerMotion       ~= MOTION_ATTACK
									and OwnerMotion       ~= MOTION_ATTACK2
									and LastOwnerMotion   ~= MOTION_ATTACK
									and LastOwnerMotion   ~= MOTION_ATTACK2
									and BygoneOwnerMotion ~= MOTION_ATTACK
									and BygoneOwnerMotion ~= MOTION_ATTACK2
									)
									) then
										skill = Available[i].Skill;
										level = Available[i].Level;
										target = MyEnemy
										local tX, tY = GetV(V_POSITION, target); 
										target = 0
										x, y = tX, tY
										slot = i;
									end
								end
							end
						end
						
						--  ESQUIVA ESPECIAL
						if (8023 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerAFK and 
							AutoSnipes ~= 2) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  FILIR
						-- ========================================================================
						if (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  VÔO FRENÉTICO
							if (8010 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  AMISTR
						-- ========================================================================
						if (Homun == AMISTR or Homun == AMISTR_H or Homun == AMISTR2 or Homun == AMISTR_H2) 
						or (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  FORTALEZA
							if (8006 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  SEDE DE SANGUE
							if (8008 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 30 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						
						
					elseif (MyState == EVADE_ST) then
					
						-- ========================================================================
						--  ESTADO DE PERIGO
						-- ========================================================================						
						--  ESQUIVA ESPECIAL
						if (8023 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerAFK) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						--  RAIVA ILUMINADA
						if (8035 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							local okToUse = false
							if (not IsAvailable(8032)) then
								okToUse = true;
							else
								local iConflict = GetSlotOfSkill(8032);
								if (GetTick() > Skills[Available[iConflict].Skill].Reuse) then
									okToUse = true;
								end
							end
							if (okToUse and MyHPPerc <= 25 and MyState ~= IDLE_ST) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						--  ARMADURA DE GRANITO
						if (8040 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerHPPerc >= 50 and MyHPPerc >= 50 and OwnerAFK and MyState ~= IDLE_ST) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  OFENSIVAS GERAIS
						-- ========================================================================
						--  TROCA DE LUGAR
						if (8005 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (CountEnemiesCloseTo(MyID) <= CountEnemiesCloseTo(OwnerID)) and math.random(1, 100) <= 80 
							and OwnerMotion ~= MOTION_HIT and (LastOwnerMotion == MOTION_HIT or WasHitCastling)
							and GetDistance2(OwnerID, MyID) <= 1
							then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyID
								slot = i;
							end
						end
						
						--  PICA-PAU
						if (8009 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) 
						and not UseEleanorTinderBreaker
						then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  CAPRICHO
						if (UseCaprice and 8013 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  BÊNÇÃO CAÓTICA
						if (UseCaprice and 8014 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (MyHPPerc < 80 or OwnerHPPerc < 80) and math.random(1, 100) <= 50 then
								skill = Available[i].Skill;
								level = Available[i].Level;
								if     math.random(1, 100) <= 40 then level = 4;
								elseif math.random(1, 100) <= 30 then level = 3;
								elseif math.random(1, 100) <= 20 then level = 2;
								elseif math.random(1, 100) <= 10 then level = 1; end
								target = MyID
								slot = i;
							end
						end
						
						--  CONVOCAÇÃO
						if (UseSeraSummonLegion and 8018 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  PONTO DE PARALISIA
						if (UseSeraParalyze and 8019 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  NÉVOA VENENOSA
						if (UseSeraPoisonMist and 8020 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									local tX, tY = GetV(V_POSITION, target); 
									if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
										if (LongRangeShooter) then
											target = MyID
											tX, tY = GetV(V_POSITION, target);
										end
									end
									target = 0
									x, y = tX, tY
									slot = i;
								end
							end
						end
						
						--  CHOQUE SUPERSÔNICO
						if (UseEiraEraseCutter and 8024 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								if (level > 1 and math.random(1, 100) <= 50) then
									level = 1;
									if     math.random(1, 100) <= 40 then level = 2;
									elseif math.random(1, 100) <= 30 then level = 3;
									elseif math.random(1, 100) <= 20 then level = 4;
									elseif math.random(1, 100) <= 10 then level = 5; end
								elseif (level > 4) then
									if     math.random(1, 100) <= 40 then level = 4;
									elseif math.random(1, 100) <= 30 then level = 3;
									elseif math.random(1, 100) <= 20 then level = 2;
									elseif math.random(1, 100) <= 10 then level = 1; end
								end
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  ONDA SUPERSÔNICA
						if (UseEiraXenoSlasher and 8025 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								if (CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									if (level > 1 and math.random(1, 100) <= 50) then
										level = 1;
										if     math.random(1, 100) <= 40 then level = 2;
										elseif math.random(1, 100) <= 30 then level = 3;
										elseif math.random(1, 100) <= 20 then level = 4;
										elseif math.random(1, 100) <= 10 then level = 5; end
									elseif (level > 4) then
										if     math.random(1, 100) <= 40 then level = 4;
										elseif math.random(1, 100) <= 30 then level = 3;
										elseif math.random(1, 100) <= 20 then level = 2;
										elseif math.random(1, 100) <= 10 then level = 1; end
									end
									target = MyEnemy
									local tX, tY = GetV(V_POSITION, target); 
									target = 0
									x, y = tX, tY
									slot = i;
								end
							end
						end
						
						--  BRISA DA CALMARIA
						if (UseEiraSilentBreeze and 8026 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  GARRA SUPERSÔNICA
						if (8028 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse and MyStyle == STYLE_FIGHT) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  QUEBRA-COSTELAS
						if (UseEleanorTinderBreaker and 8036 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse and MyStyle == STYLE_GRAPP) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  IMPACTO PRECISO
						if (UseBayeriStahlHorn and 8031 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  FÚRIA ILUMINADA
						if (8032 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyID
								slot = i;
							end
						end
						
						--  LUZ SALVADORA
						if (8033 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyID
								slot = i;
							end
						end
						
						--  ILLUMINATUS
						if (UseBayeriHailegeStar and 8034 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  INUNDAÇÃO DE MAGMA
						if (8039 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyID
								slot = i;
							end
						end
							
						--  DERRETIMENTO COM LAVA
						if (8041 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								if (MyHPPerc >= MyAggroHPPerc or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1 or MyHPPerc < MyEvadeHPPerc) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									local tX, tY = GetV(V_POSITION, target); 
									if (GetDistance(MyX, MyY, tX, tY) > SkillRange(MyID, skill, level)) then
										if (LongRangeShooter) then
											target = MyID
											tX, tY = GetV(V_POSITION, target);
										end
									end
									target = 0
									x, y = tX, tY
									slot = i;
								end
							end
						end
						
						--  CINZAS VULCÂNICAS
						if (8043 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (math.random(1, 100) <= 20) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyEnemy
									local tX, tY = GetV(V_POSITION, target); 
									target = 0
									x, y = tX, tY
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  FILIR
						-- ========================================================================
						if (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  VÔO FRENÉTICO
							if (8010 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  AMISTR
						-- ========================================================================
						if (Homun == AMISTR or Homun == AMISTR_H or Homun == AMISTR2 or Homun == AMISTR_H2)
						or (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round)) 
						then
							--  FORTALEZA
							if (8006 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 50 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
							
							--  SEDE DE SANGUE
							if (8008 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 30 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						-- ========================================================================
						--  LIF
						-- ========================================================================
						if (Homun == LIF or Homun == LIF_H or Homun == LIF2 or Homun == LIF_H2) 
						or (AutoSkills == 2 --and OwnerAFK 
						and (MySPPerc <= MySPToBuff or i >= Round))
						then
							--  BATER EM RETIRADA
							if (8002 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
								if math.random(1, 100) <= 25 then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
					
					
					
					end;
					
					-- ========================================================================
					--  EMERGÊNCIA
					-- ========================================================================		
					if ((MyHPPerc < MyEvadeHPPerc or OwnerHPPerc < MyEvadeHPPerc or playerEnemyDanger) and AutoSnipes ~= 2) then
						
						--  ESQUIVA ESPECIAL
						if (8023 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerAFK) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						--  RAIVA ILUMINADA
						if (8035 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							local okToUse = false
							if (not IsAvailable(8032)) then
								okToUse = true;
							else
								local iConflict = GetSlotOfSkill(8032);
								if (GetTick() > Skills[Available[iConflict].Skill].Reuse) then
									okToUse = true;
								end
							end
							if (okToUse and MyHPPerc <= 25 and MyState ~= IDLE_ST) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
						
						--  ARMADURA DE GRANITO
						if (8040 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (OwnerHPPerc >= 50 and MyHPPerc >= 50 and OwnerAFK and MyState ~= IDLE_ST) then
								if (not IsPlayer(MyEnemy) 
								or (OwnerMotion       ~= MOTION_ATTACK
								and OwnerMotion       ~= MOTION_ATTACK2
								and LastOwnerMotion   ~= MOTION_ATTACK
								and LastOwnerMotion   ~= MOTION_ATTACK2
								and BygoneOwnerMotion ~= MOTION_ATTACK
								and BygoneOwnerMotion ~= MOTION_ATTACK2
								)
								) then
									skill = Available[i].Skill;
									level = Available[i].Level;
									target = MyID
									slot = i;
								end
							end
						end
					end
				end;
				
				-- ========================================================================
				--  ASSISTENTE
				-- ========================================================================
				if Merce then
					if     (MyState == IDLE_ST  ) then
						
						--  BLOQUEIO
						if (8220 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						--  MAGNIFICAT
						if (8222 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						--  RAPIDEZ COM ARMA
						if (8223 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							slot = i;
						end
						
						
						
					elseif (MyState == FOLLOW_ST) then
						
					elseif (MyState == CHASE_ST ) then
						
						-- ========================================================================
						--  OFENSIVAS GERAIS
						-- ========================================================================
						--  RAJADA DE FLECHAS
						if (8207 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  CHUVA DE FLECHAS
						if (8208 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if ((MyHPPerc >= MyAggroHPPerc and CountEnemiesCloseTo(MyID, MaxDistance, true) > 1)
							or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								local tX, tY = GetV(V_POSITION, target); 
								target = 0
								x, y = tX, tY
								slot = i;
							end
						end
						
						--  TIRO PRECISO
						if (8215 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  PROVOCAR
						if (8232 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  DIMINUIR AGILIDADE
						if (8234 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						
						
					elseif (MyState == ATTACK_ST) then
						
						-- ========================================================================
						--  OFENSIVAS GERAIS
						-- ========================================================================
						--  GOLPE FULMINANTE
						if (8201 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  IMPACTO EXPLOSIVO
						if (8202 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyID
							-- target = MyEnemy
							-- if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								-- if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								-- and (
								-- (MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								-- or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								-- )
								-- and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									-- target = MySecondaryEnemy
								-- end
							-- end
							slot = i;
						end
						
						--  IMPACTO DE TYR
						if (8203 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if ((MyHPPerc >= MyAggroHPPerc)
							or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  RAJADA DE FLECHAS
						if (8207 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  CHUVA DE FLECHAS
						if (8208 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if ((MyHPPerc >= MyAggroHPPerc and CountEnemiesCloseTo(MyID, MaxDistance, true) > 1)
							or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								local tX, tY = GetV(V_POSITION, target); 
								target = 0
								x, y = tX, tY
								slot = i;
							end
						end
						
						--  TIRO PRECISO
						if (8215 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  PERFURAR
						if (8216 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  BRANDIR LANÇA
						if (8217 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if ((MyHPPerc >= MyAggroHPPerc)
							or CountEnemiesCloseTo(MyID) > 1 or CountEnemiesCloseTo(OwnerID) > 1) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						--  PERFURAR EM ESPIRAL
						if (8218 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  IMPACTO
						if (8225 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  PROVOCAR
						if (8232 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							skill = Available[i].Skill;
							level = Available[i].Level;
							target = MyEnemy
							if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
								if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
								and (
								(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
								or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
								)
								and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
									target = MySecondaryEnemy
								end
							end
							slot = i;
						end
						
						--  DIMINUIR AGILIDADE
						if (8234 == Available[i].Skill and GetTick() > Skills[Available[i].Skill].Reuse) then
							if (not IsPlayer(MyEnemy) 
							or (OwnerMotion       ~= MOTION_ATTACK
							and OwnerMotion       ~= MOTION_ATTACK2
							and LastOwnerMotion   ~= MOTION_ATTACK
							and LastOwnerMotion   ~= MOTION_ATTACK2
							and BygoneOwnerMotion ~= MOTION_ATTACK
							and BygoneOwnerMotion ~= MOTION_ATTACK2
							)
							) then
								skill = Available[i].Skill;
								level = Available[i].Level;
								target = MyEnemy
								if (MySecondaryEnemy > 0 and not IsKS(MySecondaryEnemy) and CanDoKS ~= MyEnemy) then
									if ((not IsPlayer(MyEnemy) or IsPlayer(MySecondaryEnemy)) 
									and (
									(MyHPPerc >= MyAggroHPPerc and (MyBehavior == BEHA_ATTACK or GetBehavTo(MyEnemy) == "Aggressive"))
									or (GetDistance2(MyID, MySecondaryEnemy) >= GetDistance2(MyID, MyEnemy) and math.random(1, 100) <= 50)
									)
									and GetDistance2(MyID, MySecondaryEnemy) <= SkillRange(MyID, skill, level)) then	
										target = MySecondaryEnemy
									end
								end
								slot = i;
							end
						end
						
						
						
					end
				end
				
				if (skill ~= 0) then
					local range = SkillRange(MyID, skill, level)
					local distance;
					if (target > 0) then
						distance = GetDistance2(MyID, target)
					else
						distance = GetDistance(MyX, MyY, x, y)
					end
					
					local minSP = Skills[Available[i].Skill].MinSP[level]
					
					if (distance > range) then
						skill = lastSkill
						level = lastLevel 
						target = lastTarget
						x, y = lastX, lastY
						slot = lastSlot
					elseif (minSP ~= nil) then
						if (MySP < minSP) then
							skill = lastSkill
							level = lastLevel 
							target = lastTarget
							x, y = lastX, lastY
							slot = lastSlot
						end
					end
				end
				if (skill ~= 0 and slot >= Round) then 
					
					-- if (count >= Round) then
						break
					-- end
					-- count = count + 1;
				end;
			end;
		end
	end
	if (skill == 0) then
		Round = 1;
	else
		Round = slot + 1; if (Round > Total or Round < 1) then Round = 1; end
		
		-- Log("Round: "..Round)
		-- Log("skill: "..skill)
		-- Log("slot: "..slot)
	end
return skill, level, target, slot, x, y; end
---------------------------------------------------------------------------
--  Função que adquire um alvo próximo para curar ou buff'ar.
----------------------------- 
function GetFriendToHeal(skill, level)
---------------------------------------------------------------------------
	if (Skills[skill] == nil) then return 0; end
	for i, v in pairs(Actors) do 
		if (Buffed[v] == nil) then
			if (v ~= MyID) and (v ~= OwnerID) then
				if (skill == 8021) then
					if (GetDistance2(MyID, v) <= SkillRange(MyID, skill, level)) then
						if (Motions[v] == MOTION_SIT) then
							Buffed[v] = GetTick() + Skills[skill].Duration[level];
							return v;
						end
					end
				end
				if (skill == 8026) then
					if (GetDistance2(MyID, v) <= SkillRange(MyID, skill, level)) then
						if (Motions[v] == MOTION_SIT or Motions[v] == MOTION_DEAD) then
							Buffed[v] = GetTick() + 3000; --+ Skills[skill].Duration[level];
							return v;
						end
					end
				end
			end
		end
	end
return 0; end
---------------------------------------------------------------------------