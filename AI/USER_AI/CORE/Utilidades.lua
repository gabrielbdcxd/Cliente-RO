---------------------------------------------------------------------------
-- ========================================================================
--  FUNÇÕES DE REGISTRO
-- ========================================================================
---------------------------------------------------------------------------
AIType                 		= 0
CreateLog                   = false
---------------------------------------------------------------------------
function Log(message)
---------------------------------------------------------------------------
	if (CreateLog) then
		if (AIType > 0) then
			if (FileExists(FILES[AIType].LOG)) then	
				WriteFile( FILES[AIType].LOG, message.."\n", "a+");
			end;
		end;
	end
	if (AIType >= 2) then TraceAI("[MERCE] assistente: "..message);
	else				  TraceAI("[HOMUN] homunculus: "..message);
	end;
end;
---------------------------------------------------------------------------
-- ========================================================================
--  UTILIDADES DE LISTAGEM
-- ========================================================================
---------------------------------------------------------------------------
--  The pairs(t) gives a general iterator over all the keys and values in a table, numerical or not, in no particular 
-- order; ipairs(t) goes over the array part, in order.
List 						= {}
-----------------------------
function List.new()
---------------------------------------------------------------------------
	return {first = 0, last = -1}
end
---------------------------------------------------------------------------
function List.pushleft(list, value)
---------------------------------------------------------------------------
	local first = list.first; 
	for i = List.count(list), 0, -1 do
		list[i + 1] = list[i];
		list[i] = nil
	end
	list[first] = value; list.last = list.last + 1;
end
---------------------------------------------------------------------------
function List.pushright(list, value)
---------------------------------------------------------------------------
	local last = list.last + 1; list.last = last; list[last] = value
end
---------------------------------------------------------------------------
function List.popleft(list) --  ERRO
---------------------------------------------------------------------------
	local first = list.first
	if first > list.last then return nil; end
	--  To allow garbage collection.
	local value = list[first]; list[first] = nil; 
	
	for i = first + 1, List.count(list), 1 do
		list[i - 1] = list[i];
		list[i] = nil
	end
	list.last = list.last - 1;
return value; end
---------------------------------------------------------------------------
function List.popright(list)
---------------------------------------------------------------------------
	local last = list.last
	if list.first > last then return nil; end
	local value = list[last]; list[last] = nil; list.last = last - 1; 
return value; end
---------------------------------------------------------------------------
function List.clear(list)
---------------------------------------------------------------------------
	for i, v in pairs(list) do
		list[i] = nil
	end
--[[
	if List.size(list) == 0 then
		return
	end
	local first = list.first; local last = list.last
	for i = first, last do
		list[i] = nil
	end
--]]
	list.first = 0; list.last = -1
end
---------------------------------------------------------------------------
function List.size(list) --  Função somente para listas com índices contínuos.
---------------------------------------------------------------------------
	local size = list.last - list.first + 1
return size; end
---------------------------------------------------------------------------
function List.count(list)
---------------------------------------------------------------------------
	local c = 0; for i, v in pairs(list) do c = c + 1; end
return c; end
---------------------------------------------------------------------------
function List.indexOf(list, value)
---------------------------------------------------------------------------
	local index = 0; for i, v in pairs(list) do if (v == value) then index = i; break; end; end
return index; end
---------------------------------------------------------------------------
function List.indexOfV2(list, value)
---------------------------------------------------------------------------
	-- local index = 0; for i, v in ipairs(list) do if (v == value) then index = i; break; end; end
	for i = List.count(list), 0, -1 do
		if list[i] == value then
			index = i; break;
		end
	end
return index; end
---------------------------------------------------------------------------
function List.contains(list, value)
---------------------------------------------------------------------------
	local result = false; for i, v in pairs(list) do if (v == value) then result = true; break; end; end
return result; end
---------------------------------------------------------------------------
function List.containsV2(list, value)
---------------------------------------------------------------------------
	local result = false; --for i, v in ipairs(list) do if (v == value) then result = true; break; end; end
	
	for i = List.count(list), 0, -1 do
		if list[i] == value then
			result = true; break;
		end
	end
return result; end
---------------------------------------------------------------------------
function List.containsIndex(list, value)
---------------------------------------------------------------------------
	local result = false; for i, v in pairs(list) do if (i == value) then result = true; break; end; end
return result; end
---------------------------------------------------------------------------
function List.remove(list, value, all)
---------------------------------------------------------------------------
	if all == nil then all = false; end;
	
	for i, v in pairs(list) do if (v == value) then list[i] = nil; if not all then break; end; end; end
end
---------------------------------------------------------------------------
function List.removeV2(list, value, all)
---------------------------------------------------------------------------
	if all == nil then all = false; end;
	
	local done = false;
	local removedCount = 0;
	--Log("count: "..List.count(list));
	for i = 0, List.count(list), 1 do
		if (list[i] == nil) then
			
		else
			-- Log("["..i.."] = "..list[i])
			if list[i] == value and not done then
				-- Log("remove");
				removedCount = removedCount + 1
				
				
				
				if not all then done = true; end;
			else
				list[i - removedCount] = list[i];
			end
		end
		if (removedCount > 0) then
			list[i] = nil
		end
	end
	-- Log("first: "..list.first)
	-- Log("last: "..list.last)
end
-- ---------------------------------------------------------------------------
-- function ripairs(t)
-- ---------------------------------------------------------------------------
	-- local max = 1
	-- while t[max] ~= nil do
		-- max = max + 1
	-- end
	-- local function ripairs_it(t, i)
		-- i = i - 1
		-- local v = t[i]
		-- if v ~= nil then
			-- return i, v
		-- else
			-- return nil
		-- end
	-- end
	-- return ripairs_it, t, max
-- end
---------------------------------------------------------------------------
-- ========================================================================
--  FUNÇÕES DE POSICIONAMENTO PADRÃO
-- ========================================================================
---------------------------------------------------------------------------
function GetDistance(x1, y1, x2, y2)
---------------------------------------------------------------------------
	if (x1 == -1 or x2 == -1 or y1 == -1 or y2 == -1) then return -1; end
return math.floor(math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)); end
---------------------------------------------------------------------------
function GetDistance2(id1, id2)
---------------------------------------------------------------------------
	local x1, y1 = GetV(V_POSITION, id1); local x2, y2 = GetV(V_POSITION, id2)
return GetDistance(x1, y1, x2, y2); end
---------------------------------------------------------------------------
function BlockDistance(x1, y1, x2, y2)
---------------------------------------------------------------------------
	if (x1 == -1 or x2 == -1 or y1 == -1 or y2 == -1) then return -1; end
	local x_delta = math.abs(x2 - x1); local y_delta = math.abs(y2 - y1)
	if x_delta > y_delta then return x_delta; end
return y_delta; end
---------------------------------------------------------------------------
function BlockDistance2(id1, id2)
---------------------------------------------------------------------------
	local x1, y1 = GetV(V_POSITION, id1); local x2, y2 = GetV(V_POSITION, id2)
return BlockDistance(x1, y1, x2, y2); end
---------------------------------------------------------------------------
function GetOwnerPosition(id)
---------------------------------------------------------------------------
return GetV(V_POSITION, GetV(V_OWNER, id)); end
---------------------------------------------------------------------------
function GetDistanceFromOwner(id)
---------------------------------------------------------------------------
	local x1, y1 = GetOwnerPosition(id); local x2, y2 = GetV(V_POSITION, id)
	if (x1 == -1 or x2 == -1) then return -1; end
return GetDistance(x1, y1, x2, y2); end
---------------------------------------------------------------------------
IgnoreDead = 0;
-----------------------------
function IsOutOfSight(id1, id2, screen)
---------------------------------------------------------------------------
	if (screen == nil) then screen = true; end
	local x1, y1 = GetV(V_POSITION, id1); local x2, y2 = GetV(V_POSITION, id2)
	
	if GetV(V_MOTION, id2) == MOTION_DEAD then return true; end
	---------------------
	if (x2 == -1 or y2 == -1) then return true; end
	---------------------
	--if (id1 < 0) then return true; end
	if (Motions[id2] == nil) then return true; end;
	---------------------
	if (screen) then if (BlockDistance(x2, y2, OwnerX, OwnerY) > 14) then return true; end; end
return false; end
---------------------------------------------------------------------------
function IsInAttackSight(id1, id2)
---------------------------------------------------------------------------
	local x1, y1 = GetV(V_POSITION, id1); local x2, y2 = GetV(V_POSITION, id2)

	if (x1 == -1) or (x2 == -1) then return false; end

	local d = GetDistance(x1, y1, x2, y2); local a = GetV(V_ATTACKRANGE, id1)
	if a >= d then return true; end
return false; end
---------------------------------------------------------------------------
function SkillRange(myID, skill, level)
---------------------------------------------------------------------------
	local mySkillRange = GetV(V_SKILLATTACKRANGE_LEVEL, myID, skill, level); local alternateRange = mySkillRange; if Skills[skill] ~= nil then if Skills[skill].Range ~= nil then if Skills[skill].Range[level] ~= nil then 
		if (Skills[skill].Range[level] > mySkillRange) then alternateRange = Skills[skill].Range[level]; end; end; end; end;
return mySkillRange, alternateRange; end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE ARQUIVOS
-- ========================================================================
---------------------------------------------------------------------------
function FileExists(path)
---------------------------------------------------------------------------
	local file = io.open(path, "rb"); if file then file:close(); end
return file ~= nil; end
---------------------------------------------------------------------------
--  Modos para escrita (mode):
-- - "r": read mode (the default);
-- - "w": write mode; 
-- - "a": append mode; 
-- - "r+": update mode, all previous data is preserved; 
-- - "w+": update mode, all previous data is erased; 
-- - "a+": append update mode, previous data is preserved, writing is only allowed at the end of file.
-----------------------------
function WriteFile(path, data, mode)
---------------------------------------------------------------------------
	Log("[FILE WRITE] "..path)
	local file = io.open(path, mode)
	if file then file:write(data); file:close(); end
end
---------------------------------------------------------------------------
function AddIDToPath(path, id)
---------------------------------------------------------------------------
	local file   = string.sub(path, findLast(path, "/") + 1);
	--Log(file);
	local folder = string.sub(path, 1, findLast(path, "/"));
	--Log(folder);
	path = folder..OwnerID.."_"..file
return path; end
---------------------------------------------------------------------------
function findLast(haystack, needle)
---------------------------------------------------------------------------
    --  Set the third arg to false to allow pattern matching
    local found = haystack:reverse():find(needle:reverse(), nil, true)
    if found then
        return haystack:len() - needle:len() - found + 2 
    else
        return found
    end
end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE DESTINOS
-- ========================================================================
---------------------------------------------------------------------------
--  Teve que ser criado após o jogo começar a travar a movimentação do homunculus para a mesma posição de outros IDs.
--  Previne que o homunculus se mova para mesma posição de outros personagens, e que ele saia da tela.
-----------------------------
LastPreRepairX = -1
LastPreRepairY = -1
LastRepairedX  = -1
LastRepairedY  = -1
-----------------------------
function RepairDest(myID, x, y)
---------------------------------------------------------------------------
	local maxTries = 3; local countTries = 0; local validPos = false; local myX, myY = GetV(V_POSITION, myID);
	
	if (x == -1 or y == -1) then 
		x, y = myX, myY; end;
	local preX, preY = x, y; local postX, postY = x, y;
		
	while (countTries <= maxTries and GetDistance(x, y, myX, myY) > 15) do
		countTries = countTries + 1; 
		if (LastPreRepairX == x and LastPreRepairY == y) then
			x = LastRepairedX;
			y = LastRepairedY;
			postX, postY = x, y;
		else
										  --  If a destination is further than a specific distance, in this case, a distance that is too long for the server to process.
			x = math.floor((x + myX) / 2) --  New location is calculated as a midpoint between original destination and current location. 
			y = math.floor((y + myY) / 2)  
			postX, postY = -1, -1;
		end
	end; 
	
	countTries = 0; 
	
	-- while (countTries <= maxTries and BlockDistance(x, y, OwnerX, OwnerY) > MaxDistance) do
		-- x = math.floor((x + myX) / 2) 
		-- y = math.floor((y + myY) / 2)  
	-- countTries = countTries + 1; end; countTries = 0; 
	
	local vX, vY = -1, -1; local rX, rY = 0, 0;
	while (countTries <= maxTries and not validPos) do
		countTries = countTries + 1; 
		validPos = true
		
		local added = 1
		for i, v in pairs(Actors) do
			if v > 0 and v ~= myID and GetV(V_MOTION, v) ~= MOTION_DEAD then
				
				vX, vY = GetV(V_POSITION, v)
				if vX == x and vY == y then
					
					if  (LastPreRepairX == preX and LastPreRepairY == preY
					and (postX          == x    and postY          == y   )
					and  postX >= 0) then
						x = LastRepairedX;
						y = LastRepairedY;
						postX, postY = -1, -1;
					end
					if vX == x and vY == y then
						rX, rY = 0, 0;
						if (--AnyoneCouldMove and 
						MyMotion ~= MOTION_MOVE and LastMyMotion ~= MOTION_MOVE) then
							local attackingSomething = false
							if (MyNearestEnemy > 0) then
								if (GetDistance2(MyID, MyNearestEnemy) <= MyAttackRange) then
									attackingSomething = true
								end
							end
							if (not attackingSomething) then
								if math.random(1, 100) <= 50 then rX = -1; else rX = 1; end
								if math.random(1, 100) <= 50 then rY = -1; else rY = 1; end
							end
						end;
						if math.random(1, 100) <= 50 then
							if     rX ~= 0  then x = x + rX;
							elseif myX > x  then x = x - 1; if (math.abs(OwnerX - x) > MaxDistance) then x = x + 1 + added; added = added + 1; end;
							elseif myX < x  then x = x + 1; if (math.abs(OwnerX - x) > MaxDistance) then x = x - 1 - added; added = added + 1; end;
							end
							if vX == x and vY == y then
								if     rY ~= 0  then y = y + rY;
								elseif myY > y  then y = y - 1; if (math.abs(OwnerY - y) > MaxDistance) then y = y + 1 + added; added = added + 1; end;
								elseif myY < y  then y = y + 1; if (math.abs(OwnerY - y) > MaxDistance) then y = y - 1 - added; added = added + 1; end;
								end
							end
						else
							if     rY ~= 0  then y = y + rY;
							elseif myY > y  then y = y - 1; if (math.abs(OwnerY - y) > MaxDistance) then y = y + 1 + added; added = added + 1; end;
							elseif myY < y  then y = y + 1; if (math.abs(OwnerY - y) > MaxDistance) then y = y - 1 - added; added = added + 1; end;
							end
							if vX == x and vY == y then
								if     rX ~= 0  then x = x + rX;
								elseif myX > x  then x = x - 1; if (math.abs(OwnerX - x) > MaxDistance) then x = x + 1 + added; added = added + 1; end;
								elseif myX < x  then x = x + 1; if (math.abs(OwnerX - x) > MaxDistance) then x = x - 1 - added; added = added + 1; end;
								end
							end
						end
					end
				validPos = false; end
			end
		end; 
		
		if (math.abs(OwnerX - x) > MaxDistance) then
			if     x > OwnerX  then x = x - (math.abs(OwnerX - x) - MaxDistance); 
			elseif x < OwnerX  then x = x + (math.abs(OwnerX - x) - MaxDistance); end
		end;
		if (math.abs(OwnerY - y) > MaxDistance) then  
			if     y > OwnerY  then y = y - (math.abs(OwnerY - y) - MaxDistance); 
			elseif y < OwnerY  then y = y + (math.abs(OwnerY - y) - MaxDistance); end 
		end; 
		-- Log(math.abs(OwnerX - x));
		-- Log(math.abs(OwnerY - y));
	end; 
	
	countTries = 0;
	LastPreRepairX = preX
	LastPreRepairY = preY
	LastRepairedX = x
	LastRepairedY = y
return x, y; end
---------------------------------------------------------------------------
LastID = 0
LastIDIsCurrentID = false
LastIDMoved       = false
CurX = -1
CurY = -1
LastX  = -1
LastY  = -1
DeltaX  = 0
DeltaY  = 0
LastDeltaX  = 0
LastDeltaY  = 0
-----------------------------
function BestMovementTo(id, skill, level, myID)
---------------------------------------------------------------------------	
	if skill == nil then skill = 0; end; if level == nil then level = 0; end; if myID == nil then myID = MyID; end;
	local myX, myY = GetV(V_POSITION, myID); 
	local iX, iY = GetV(V_POSITION, id); 
	local oX, oY = OwnerX, OwnerY; 
	local success, sX, sY = pcall(GetV, V_POSITION_APPLY_SKILLATTACKRANGE, id, skill, level); 
	if (not success) then
		sX, sY = iX, iY
	end
	local x, y = iX, iY
	local maxTries = 3; local countTries = 0;
	
	local distanceX = 0; 
	local distanceY = 0; 
	
	if id == OwnerID then 
		x, y = oX, oY;
		if MyState == FOLLOW_ST then
			if OwnerPosChanged or OwnerMotion == MOTION_MOVE or LastOwnerMotion == MOTION_MOVE or NeedToFollow then
				distanceX = math.floor(math.abs(MyX - OwnerX)); if (distanceX <= 0) then distanceX = 1; end;
				distanceY = math.floor(math.abs(MyY - OwnerY)); if (distanceY <= 0) then distanceY = 1; end;
				
				local deltaLastX = LastOwnerMovementMarkX * (distanceX) * 2
				local deltaLastY = LastOwnerMovementMarkY * (distanceY) * 2
				local deltaX = OwnerMovementMarkX * (distanceX) * 2
				local deltaY = OwnerMovementMarkY * (distanceY) * 2		
				if deltaX ~= 0 then oX = MyX + deltaX; 
				else                oX = MyX + deltaLastX; end
				if deltaY ~= 0 then oY = MyY + deltaY; 
				else                oY = MyY + deltaLastY; end
				while (countTries <= maxTries and GetDistance(OwnerX, OwnerY, oX, oY) > MaxDistance) do
					countTries = countTries + 1;
													   --  If a destination is further than a specific distance, in this case, a distance that is too long for the server to process.
					oX = math.floor((oX + OwnerX) / 2) --  New location is calculated as a midpoint between original destination and current location. 
					oY = math.floor((oY + OwnerY) / 2)  
				end; 
				
				countTries = 0;
				
				x, y = oX, oY;
			end
		end
		return x, y;
	end
	
	
	
	if GetDistance(sX, sY, x, y) ~= 0 and SkillRange(myID, skill, level) >= GetDistance(sX, sY, x, y) then 
		x, y = sX, sY
	elseif GetDistance(sX, sY, x, y) < GetDistance(myX, myY, x, y) then 
		x, y = sX, sY
	elseif GetDistance(sX, sY, x, y) < GetDistance(MyDestX, MyDestY, x, y) then
		x, y = sX, sY
	end;
		
	if (id == LastID) then
		
		LastIDIsCurrentID = true
		
		--if LastIDMoved then 
			--  Mover-se à frente.
			local deltaX = DeltaX; local deltaY = DeltaY
			x, y = GetV(V_POSITION, id);
			-- if math.abs(deltaX) <= 0 then deltaX = LastDeltaX; end;
			-- if math.abs(deltaY) <= 0 then deltaY = LastDeltaY; end;
			--if Motions[id] == MOTION_MOVE then
				if math.abs(DeltaX) <= 0 then deltaX = LastDeltaX; end;
				if math.abs(DeltaY) <= 0 then deltaY = LastDeltaY; end;
			--end
			if not LastIDMoved or IsInAttackSight(MyID, id) then 
				if math.abs(deltaX) > MyAttackRange then
					if     (deltaX > 0) then deltaX =  MyAttackRange
					elseif (deltaX < 0) then deltaX = -MyAttackRange
					end
				end
				if math.abs(deltaY) > MyAttackRange then
					if     (deltaY > 0) then deltaY =  MyAttackRange
					elseif (deltaY < 0) then deltaY = -MyAttackRange
					end
				end
			end
			if     (x > LastX or (LastIDMoved and MyMotion == MOTION_MOVE)) and 
			(deltaX > 0) and (MyX < x or (not IsInAttackSight(MyID, id) and MyMotion == MOTION_MOVE))
			then x = x + math.abs(deltaX);
			elseif (x < LastX or (LastIDMoved and MyMotion == MOTION_MOVE)) and 
			(deltaX < 0) and (MyX > x or (not IsInAttackSight(MyID, id) and MyMotion == MOTION_MOVE))
			then x = x - math.abs(deltaX); end
			if     (y > LastY or (LastIDMoved and MyMotion == MOTION_MOVE)) and 
			(deltaY > 0) and (MyY < y or (not IsInAttackSight(MyID, id) and MyMotion == MOTION_MOVE))
			then y = y + math.abs(deltaY);
			elseif (y < LastY or (LastIDMoved and MyMotion == MOTION_MOVE)) and 
			(deltaY < 0) and (MyY > y or (not IsInAttackSight(MyID, id) and MyMotion == MOTION_MOVE))
			then y = y - math.abs(deltaY); end
			-- LastDeltaX = deltaX
			-- LastDeltaY = deltaY
		--end
	else
		--  Mover para a mesma posição.
		
		
		
		--LastDeltaX = 0
		--LastDeltaY = 0
	end
	--LastX  = iX
	--LastY  = iY
	LastID = id;
return x, y; end
---------------------------------------------------------------------------
function MoveToRandom(myID, priority)
---------------------------------------------------------------------------
	if (priority == nil) then priority = false; end;
	local rX, rY;
	rX = OwnerX + math.random(-(MaxDistance), (MaxDistance))
	rY = OwnerY + math.random(-(MaxDistance), (MaxDistance))
	MyDestX, MyDestY = RepairDest(myID, rX, rY); Move(myID, MyDestX, MyDestY, priority)
end
---------------------------------------------------------------------------
function ShouldFollow(myState, distance)
---------------------------------------------------------------------------
	--Log("precisa seguir?");
	if (OwnerPosChanged or (myState == FOLLOW_ST and OwnerMotion == MOTION_MOVE)) and (OwnerNearerOrFarther == 1 or myState == FOLLOW_ST) then
		--Log("owner se mexeu");
		if (OwnerMotion == MOTION_MOVE 
		or (myState == FOLLOW_ST and MyMotion == MOTION_MOVE)) then
			--Log("owner está andando");
			if (myState == FOLLOW_ST) then	
				if OwnerPosChanged then StateTimeOut[MyState] = GetTick() + 10000; end
				return true;
			end
			if myState == CHASE_ST or myState == ATTACK_ST then 
				
				--if MyEnemy > 0 then distance = GetDistance2(OwnerID, MyEnemy); end;
				
				return (distance > MaxDistance - 10); --or distance < 0);
			end
			
			return (distance > MaxDistance - 6);
		end
	end
return false; end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE IDS
-- ========================================================================
---------------------------------------------------------------------------
function IsOffensive(id, enemy)
---------------------------------------------------------------------------
	local ti = GetV(V_TARGET, id); local te = GetV(V_TARGET, enemy)
	local enemyType = GetTypeFromID(enemy);
	
	if     ((te == id    and (IsAttacking(enemy) or IsAoEDamage(id, enemy)))) then 
		if (enemyType ~= ACOLYTE and enemyType ~= PRIEST and enemyType ~= HIGH_PRIEST and enemyType ~= ARCH_BISHOP) then
			return true, true; 
		else
			return true, false; 
		end
	elseif ((ti == enemy and (IsAttacking(id)    or IsAoEDamage(enemy, id)))  and id ~= MyID) then 
		if (enemyType ~= ACOLYTE and enemyType ~= PRIEST and enemyType ~= HIGH_PRIEST and enemyType ~= ARCH_BISHOP) then
			return true, true; 
		else
			return true, false; 
		end
	--  O alvo leva dano e não tem mais ninguém atacando: às vezes o gesto de skill falha ou não está implementado.
	elseif IgnoreDead == 0 and (Motions[id] == MOTION_HIT) and (Motions[enemy] ~= LastMotions[enemy] or LastMotions[enemy] ~= BygoneMotions[enemy]) and GetActorAttacking(id) == 0 then return true, false; end
return false, false; end
---------------------------------------------------------------------------
function IsAoEDamage(target, caster)
---------------------------------------------------------------------------
	if IsUsingSkill(caster) and Motions[target] == MOTION_HIT then return true; end
return false; end
---------------------------------------------------------------------------
function IsAttacking(id)
---------------------------------------------------------------------------
	--  Gestos Básicos:
	if  (Motions[id] == MOTION_ATTACK or Motions[id] == MOTION_ATTACK2) 
		or (LastMotions[id] == MOTION_ATTACK or LastMotions[id] == MOTION_ATTACK2)
			or (BygoneMotions[id] == MOTION_ATTACK or BygoneMotions[id] == MOTION_ATTACK2)
	--  Gestos especiais de Personagens:
	or  (Motions[id] == MOTION_FOCUSED_ARROW or LastMotions[id] == MOTION_FOCUSED_ARROW or BygoneMotions[id] == MOTION_FOCUSED_ARROW)
	or  (Motions[id] == MOTION_TK_COUNTER    or LastMotions[id] == MOTION_TK_COUNTER    or BygoneMotions[id] == MOTION_TK_COUNTER   )
	or  (Motions[id] == MOTION_TK_FLYINGKICK or LastMotions[id] == MOTION_TK_FLYINGKICK or BygoneMotions[id] == MOTION_TK_FLYINGKICK)
	or  (Motions[id] == MOTION_TK_TORNADO    or LastMotions[id] == MOTION_TK_TORNADO    or BygoneMotions[id] == MOTION_TK_TORNADO   )
	or  (Motions[id] == MOTION_TK_HEELDROP   or LastMotions[id] == MOTION_TK_HEELDROP   or BygoneMotions[id] == MOTION_TK_HEELDROP  )
	or  (Motions[id] == MOTION_TK_ROUNDHOUSE or LastMotions[id] == MOTION_TK_ROUNDHOUSE or BygoneMotions[id] == MOTION_TK_ROUNDHOUSE)
	or  (Motions[id] == MOTION_GS_GATLING    or LastMotions[id] == MOTION_GS_GATLING    or BygoneMotions[id] == MOTION_GS_GATLING   )
	or  (Motions[id] == MOTION_GS_FULLBLAST  or LastMotions[id] == MOTION_GS_FULLBLAST  or BygoneMotions[id] == MOTION_GS_FULLBLAST )
	then return true; end
return false; end
---------------------------------------------------------------------------
function IsUsingSkill(id)
---------------------------------------------------------------------------
	if ((Motions[id] == MOTION_SKILL         or LastMotions[id] == MOTION_SKILL         or BygoneMotions[id] == MOTION_SKILL        )
	or  (Motions[id] == MOTION_ATTACK        or LastMotions[id] == MOTION_ATTACK        or BygoneMotions[id] == MOTION_ATTACK       )
	or  (Motions[id] == MOTION_ATTACK2       or LastMotions[id] == MOTION_ATTACK2       or BygoneMotions[id] == MOTION_ATTACK2      )
	or  (Motions[id] == MOTION_PICKUP        or LastMotions[id] == MOTION_PICKUP        or BygoneMotions[id] == MOTION_PICKUP       )
	or  (Motions[id] == MOTION_DANCE         or LastMotions[id] == MOTION_DANCE         or BygoneMotions[id] == MOTION_DANCE        )
	or  (Motions[id] == MOTION_SING          or LastMotions[id] == MOTION_SING          or BygoneMotions[id] == MOTION_SING         ) and IgnoreDead == 0)
	or  (Motions[id] == MOTION_COUNTER       or LastMotions[id] == MOTION_COUNTER       or BygoneMotions[id] == MOTION_COUNTER      )
	or  (Motions[id] == MOTION_TOSS          or LastMotions[id] == MOTION_TOSS          or BygoneMotions[id] == MOTION_TOSS         )
	or  (Motions[id] == MOTION_BIGTOSS       or LastMotions[id] == MOTION_BIGTOSS       or BygoneMotions[id] == MOTION_BIGTOSS      )
	or  (Motions[id] == MOTION_TKM_HEAT      or LastMotions[id] == MOTION_TKM_HEAT      or BygoneMotions[id] == MOTION_TKM_HEAT     )
	or  (Motions[id] == MOTION_NJ_SKILL      or LastMotions[id] == MOTION_NJ_SKILL      or BygoneMotions[id] == MOTION_NJ_SKILL     )
	or  (Motions[id] == MOTION_GS_DESPERADO  or LastMotions[id] == MOTION_GS_DESPERADO  or BygoneMotions[id] == MOTION_GS_DESPERADO )
	then return true; end
return false; end
---------------------------------------------------------------------------
KSIsAttacking = {}
-----------------------------
function IsKS(id)
---------------------------------------------------------------------------
	if id == CanDoKS then      return false; end
	if IsPlayer(id) then       return false; end
	if 0 == IsMonster(id) then return false; end
	local enemyType = GetTypeFromID(id); if MVP_KS_OK[enemyType] ~= nil then return false; end --  MVPs não são KS.
	if GetV(V_TARGET, OwnerID) == id                         then return false; end
	for k, v in pairs(Friends) do if GetV(V_TARGET, k) == id then return false; end; end
	
	local result = false; local ti = GetV(V_TARGET, id);
	if ti > 0 then
		if (ti == MyID    or IsOffensive(id, MyID)    )
		or (ti == OwnerID or IsOffensive(id, OwnerID) ) 
		or (Friends[ti] ~= nil                        ) then return false; end
		
		for i, v in ipairs(Friends) do
			if IsOffensive(id, i) then
				return false; end;
		end
		 
		if IsOutOfSight(GetV(V_TARGET, ti), ti, false)                                       then result = false; 
		elseif IsMonster(ti) == 1 and (GetTypeFromID(ti) < 2114 or GetTypeFromID(ti) > 2125) then result = false; 
		else return true; end
	end
	for i, v in pairs(Actors) do
		if v > 0 and (v ~= OwnerID and v ~= MyID) and Friends[v] == nil then
			if 0 == IsMonster(v) then
				if GetV(V_TARGET, v) == id or IsOffensive(v, id) then return true; end
			end
		end
	end
	
	if (not IsDefensiveEnemy(id)) then
		if     Motions[id]        ~=  MOTION_STAND and Motions[id]           ~= MOTION_MOVE and Motions[id]           ~= MOTION_SKILL and Motions[id]           ~= MOTION_CAST
		and GetActorAttacking(id) == 0 and not IsInAttackSight(MyID, id)
		then 
			KSIsAttacking[id] = GetTick() + 5000
			return true; 
		elseif LastMotions[id]    ~= MOTION_STAND  and LastMotions[id]       ~= MOTION_MOVE and LastMotions[id]       ~= MOTION_SKILL and LastMotions[id]       ~= MOTION_CAST
		and GetActorAttacking(id) == 0 and not IsInAttackSight(MyID, id)
		then 
			KSIsAttacking[id] = GetTick() + 5000
			return true; 
		elseif BygoneMotions[id]  ~= MOTION_STAND  and BygoneMotions[id]     ~= MOTION_MOVE and BygoneMotions[id]     ~= MOTION_SKILL and BygoneMotions[id]     ~= MOTION_CAST
		and GetActorAttacking(id) == 0 and not IsInAttackSight(MyID, id)
		then 
			KSIsAttacking[id] = GetTick() + 5000
			return true; end
		
		if (Motions[id] ~= MOTION_STAND or LastMotions[id] ~= MOTION_STAND or BygoneMotions[id] ~= MOTION_STAND) 
		and GetV(V_TARGET, id) ~= 0 and 0 == IsMonster(GetV(V_TARGET, id)) and not IsOutOfSight(id, GetV(V_TARGET, id), false)
		then 
			KSIsAttacking[id] = GetTick() + 5000
			return true; end
	end
		
	if (KSIsAttacking[id] ~= nil) then
		if (GetTick() > KSIsAttacking[id]) then KSIsAttacking[id] = nil; 
		else
			return true;
		end
	end
	
return result; end
---------------------------------------------------------------------------
function IsValidSkillTarget(id, skill)
---------------------------------------------------------------------------
	if id == 0 then if skill == 8043 then if MyEnemy > 0 then id = MyEnemy; end; end; end;
	
	if id ~= 0 then
		local enemyType = GetTypeFromID(id);
		if enemyType == 1288 and skill == 8018 then return true; end;
		if enemyType == 1288 --  Emperium
		or enemyType == 1914 --  Cristal Azul       (Campal)
		or enemyType == 1915 --  Cristal Rosa       (Campal)
		or enemyType == 1909 --  Armazém de Comida  (Campal)
		or enemyType == 1910 --  Depósito de Comida (Campal)
		or enemyType == 1911 --  Bandeira Neutra    (Campal)
		or enemyType == 1912 --  Bandeira Guillaume (Campal)
		or enemyType == 1913 --  Bandeira Croix     (Campal)
		or enemyType == 13   --  Caixa de Tesouro
		then return false; end
		if (
		   skill == 8009 
		or skill == 8019
		or skill == 8024
		or skill == 8026
		or skill == 8031
		) 
		and enemyType >= 1078 and enemyType <= 1085 
		then return false; end
	end
return true; end
---------------------------------------------------------------------------
function GetActorAttacking(id)
---------------------------------------------------------------------------
	local result = 0;
	for i, v in pairs(Actors) do
		if v > 0 and v ~= id and not IsOutOfSight(GetV(V_TARGET, v), v) then
			if (IsAttacking(v) or IsUsingSkill(v)) or Targets[v] == id
			then result = v; break; end;
		end
	end
return result; end
---------------------------------------------------------------------------
function IsEnemy(id)
---------------------------------------------------------------------------
	if (
	   EnemiesOwnerH      [id] ~= nil
	or EnemiesOwnerM      [id] ~= nil --  Monstro pode se mover.
	or EnemiesOwnerL      [id] ~= nil --  Monstro não se mexe.
	or EnemiesDefensiveH  [id] ~= nil
	or EnemiesDefensiveM  [id] ~= nil
	or EnemiesDefensiveL  [id] ~= nil
	or EnemiesFriendsH    [id] ~= nil
	or EnemiesFriendsM    [id] ~= nil
	or EnemiesFriendsL    [id] ~= nil
	or EnemiesAggressiveH [id] ~= nil
	or EnemiesAggressiveM [id] ~= nil
	or EnemiesAggressiveL [id] ~= nil
	) then
		return true;
	end
return false; end
---------------------------------------------------------------------------
function IsDefensiveEnemy(id)
---------------------------------------------------------------------------
	if (
	   EnemiesOwnerH      [id] ~= nil
	or EnemiesOwnerM      [id] ~= nil --  Monstro pode se mover.
	or EnemiesOwnerL      [id] ~= nil --  Monstro não se mexe.
	or EnemiesDefensiveH  [id] ~= nil
	or EnemiesDefensiveM  [id] ~= nil
	or EnemiesDefensiveL  [id] ~= nil
	or EnemiesFriendsH    [id] ~= nil
	or EnemiesFriendsM    [id] ~= nil
	or EnemiesFriendsL    [id] ~= nil
	) then
		return true;
	end
return false; end
---------------------------------------------------------------------------
function IsAggroEnemy(id)
---------------------------------------------------------------------------
	if (
	   EnemiesAggressiveH [id] ~= nil
	or EnemiesAggressiveM [id] ~= nil
	or EnemiesAggressiveL [id] ~= nil
	) then
		return true;
	end
return false; end
---------------------------------------------------------------------------
function GetTypeFromID(id)
---------------------------------------------------------------------------
	local result = 0
	if Homun ~= nil then return GetV(V_HOMUNTYPE, id);
	elseif Merce ~= nil then
		if Types[id] == nil then return GetV(V_TYPE, id); else return Types[id]; end
	end
return result; end
---------------------------------------------------------------------------
function SaveTypes(aiType)	
---------------------------------------------------------------------------
	if aiType ~= 1 then return; end
	
	local update = false; local vType; local file_temp = io.open(FILES[aiType].TYPES_TEMP, "a+"); 
	for i, v in ipairs(Actors) do 
		if (v > 0 and GetV(V_MOTION, v) ~= MOTION_DEAD and IsMonster(v) == 1) then vType = GetV(V_HOMUNTYPE, v); 
			if (Types[v] ~= vType) then Types[v] = vType; update = true; if file_temp then file_temp:write(v.."."..vType.."\n"); end; end
		end
	end
	if file_temp then file_temp:close(); end;
		
	if update then
		local file_data = io.open(FILES[aiType].TYPES, "w"); if file_data then 
			local count = 0
			for i, v in pairs(Types) do file_data:write("Types["..i.."] = "..v.."\n"); count = count + 1; if (count >= 15000) then break; end; end
		file_data:close(); end
	end
end
---------------------------------------------------------------------------
function LoadTypes(aiType, id)	
---------------------------------------------------------------------------
	if aiType ~= 2 then return; end
	local file = io.open(FILES[aiType].TYPES_TEMP); if file then
		local equal, i, v;
		for l in file:lines() do equal = string.find(l, ".", 1, true); i = tonumber(string.sub(l, 1, equal - 1)); v = tonumber(string.sub(l, equal + 1));
			if i ~= nil and v ~= nil then Types[i] = v; end
		end
	file:close(); end
	if FileExists(FILES[aiType].TYPES_TEMP) then os.remove(FILES[aiType].TYPES_TEMP); end	
end
---------------------------------------------------------------------------
function IsPlayer(id)
---------------------------------------------------------------------------
return (id > 100000); end
---------------------------------------------------------------------------
function CountEnemiesCloseTo(id, distance, aggro)
---------------------------------------------------------------------------
	if aggro == nil then aggro = false; end;
	
	if ditance == nil then distance = MaxDistance; end; local ecount = 0;
	for i, v in pairs(Actors) do
		if v > 0 and not IsOutOfSight(GetV(V_TARGET, v), v) then
			if IsOffensive(id, v) or Targets[v] == id then
				if GetDistance2(id, v) <= distance then ecount = ecount + 1; end
			elseif (id == OwnerID) then
				if (EnemiesOwnerH[v] ~= nil or EnemiesOwnerM[v] ~= nil or EnemiesOwnerL[v] ~= nil) then
					ecount = ecount + 1;
				end
			elseif (id == MyID) then
				if (EnemiesDefensiveH[v] ~= nil or EnemiesDefensiveM[v] ~= nil or EnemiesDefensiveL[v] ~= nil) then
					ecount = ecount + 1;
				end
			elseif aggro 
			and (MyHPPerc >= MyAggroHPPerc and not AllyAILowHP)
			and (MyBehavior == BEHA_ATTACK or GetBehavTo(v) == "Aggressive") then
				if GetDistance2(id, v) <= distance then ecount = ecount + 1; end
			end;
		end
	end
return ecount; end
---------------------------------------------------------------------------
-- ========================================================================
--  FRIENDING
-- ========================================================================
---------------------------------------------------------------------------
Friends = {}
-----------------------------
OrderFriends = List.new()
-----------------------------
function LoadFriends(aiType)
---------------------------------------------------------------------------
	local failed = false; local ln, nbr; local fCount = 0;
	local file = AddIDToPath(FILES[aiType].FRIENDS, OwnerID)
	local f_in = io.open(file, "r"); if f_in ~= nil then 
		ln = f_in:read(); while (ln ~= nil and fCount < 50) do
			nbr = tonumber(ln) if nbr == nil then failed = true; end
			if nbr ~= nil then Friends[nbr] = 1; if (not List.containsV2(OrderFriends, nbr)) then List.pushright(OrderFriends, nbr); end; end
		fCount = fCount + 1; ln = f_in:read(); end
	f_in:close(); end
	if failed then
		Log("erro ao carregar arquivo de aliados")
		if FileExists(file) then os.remove(file); end
	end
	SearchAllyAI(aiType);
end
---------------------------------------------------------------------------
function SaveFriends(aiType, id)
---------------------------------------------------------------------------
	local result = 0; --  Adicionado ou removido.
	local playerType = GetTypeFromID(id)
	if TempFriends[id] ~= nil then TempFriends[id] = nil; if Friends[id] ~= nil then Friends[id] = nil; end; end
	if Friends[id] == nil then Friends[id] = 1;   Log("[FRIENDS] protegido ("..id..", "..playerType.."): adicionado."); result = 1; List.pushright(OrderFriends, id);
	else                       Friends[id] = nil; Log("[FRIENDS] protegido ("..id..", "..playerType.."): removido."  ); result = 2; List.removeV2 (OrderFriends, id, true); end
	RefreshFriendsFile(aiType)
return result; end
---------------------------------------------------------------------------
function RefreshFriendsFile(aiType)
---------------------------------------------------------------------------
	for i, v in pairs(Friends) do
		if (not List.containsV2(OrderFriends, i)) then Friends[i] = nil; end;
	end;
	
	local fCount = List.count(Friends); 
	if fCount > 50 then --  Se a lista tem 51 membros ou mais.
		for i = 0, (fCount - 50), 1 do --  Limpar os primeiros pra ficar 50.
			local removed = List.popleft(OrderFriends)
			if (removed) then
				Friends[removed] = nil
			end
		end
	end; fCount = 0;
	
	local f_out = io.open(AddIDToPath(FILES[aiType].FRIENDS, OwnerID), "w"); if f_out ~= nil then 
		for i = 0, List.count(OrderFriends), 1 do
			local v = OrderFriends[i]
			if (v ~= nil) then
				if v > 0 and IsPlayer(v) and v ~= AllyAI and TempFriends[v] == nil then 
					f_out:write(v.."\n");
				end; 
				fCount = fCount + 1; if fCount >= 50 then break; end
			end
		end
	f_out:close(); end
end
---------------------------------------------------------------------------
NotTempFriends = {}
-----------------------------
TempFriends = {}
-----------------------------
function SearchTempFriends(aiType, id)
---------------------------------------------------------------------------
	
	if (id > 0) and (id ~= MyID and id ~= OwnerID) and Friends[id] == nil and (not PvPHere) and IsPlayer(id) then
		if GetDistance2(id, OwnerID) < 3 then
			if NotTempFriends[id] == nil and (Motions[id] == MOTION_SIT or LastMotions[id] == MOTION_SIT or (not IsAttacking(id))) then
				TempFriends[id] = 1; Friends[id] = 1;
				return true;
			elseif IsAttacking(id) then
				NotTempFriends[id] = GetTick() + 10000;
			end
		end
	end
	
return false; end
---------------------------------------------------------------------------
TimerCheckAllyAI       = 0             --  Verificar AI aliada, de 10 em 10 s, quando assistente e homunculus ao mesmo tempo. Verificação em "Utilidades.lua".
TimerCheckAllyHP       = 0             --  Verificar HP da AI aliada.
AllyAI = 0
-----------------------------
function SearchAllyAI(aiType)
---------------------------------------------------------------------------
	
	SearchAllyHP(aiType);
	
	if (GetTick() < TimerCheckAllyAI) then return; end
	TimerCheckAllyAI = GetTick() + 10000
	
	local failed = false; local ln, nbr1, nbr2; local allyType = 0; local ally = 0; local aCount = 0; local ids = {}
	
	-- Adicionando minha AI para ser encontrada.
	local idFile = AddIDToPath(FILES[aiType].ID, OwnerID)
	local f_in = io.open(idFile, "r"); if f_in ~= nil then 
		ln = f_in:read(); while (ln ~= nil and aCount < 8) do
			nbr1 = tonumber(ln)
			if nbr1 == nil then failed = true; break; 
			else
				if nbr1 ~= MyID then 
					ids[nbr1] = OwnerID;
				end
			end
		ln = f_in:read(); aCount = aCount + 1; end;
	f_in:close(); end
	if failed then 
		Log("falha ao ler arquivo de IDs");
		if FileExists(idFile) then os.remove(idFile); end
	end; failed = false; 
	
	local f_out = io.open(idFile, "w"); if f_out ~= nil then 
		f_out:write(MyID.."\n");
		for i, v in pairs(ids) do
			f_out:write(i.."\n");
		end
	f_out:close(); else TimerCheckAllyAI = TimerCheckAllyAI + 1000; Log("falha ao abrir arquivo de IDs"); end; aCount = 0; ids = {};
	
	-- Procurando AI aliada.
	if aiType == 1 then allyType = 2; elseif aiType == 2 then allyType = 1; end; 
	if allyType == 0 then 
		if AllyAI ~= 0 then
			if Friends[AllyAI] ~= nil then Friends[AllyAI] = nil; end; 
			
			AllyAI = 0; 
		end; 
		return; 
	end; 
	
	local allyIDFile = AddIDToPath(FILES[allyType].ID, OwnerID)
	f_in = io.open(allyIDFile, "r"); if f_in ~= nil then
		ln = f_in:read(); while (ln ~= nil and aCount < 8) do
			
			nbr1 = tonumber(ln)
			if nbr1 == nil then failed = true; break; 
			else
				ids[nbr1] = OwnerID; ally = nbr1; 
			end
			
		ln = f_in:read(); aCount = aCount + 1; end
	f_in:close(); else TimerCheckAllyAI = TimerCheckAllyAI + 1000; --Log("falha ao abrir arquivo de IDs de aliados"); 
	end; 
	
	if failed then
		Log("falha ao ler arquivo de IDs de aliados");
		if FileExists(allyIDFile) then os.remove(Files[ally_type].ID); end
		if AllyAI ~= 0 then
			if Friends[AllyAI] ~= nil then Friends[AllyAI] = nil; end; AllyAI = 0; end
		
	elseif ally > 0 then --  Se encontrou AI aliada: se já existe uma AI, então ela não é mais válida, apague a antiga, caso contrário, adicione.
		if AllyAI ~= ally then
			if Friends[AllyAI] ~= nil then Friends[AllyAI] = nil; end; 
		end
		Friends[ally] = 1; AllyAI = ally; 
		--  Se foi encontrado, apague o valor no arquivo. Assim, só continuará sendo aliado se a outra AI estiver ativa reescrevendo o arquivo.
		f_out = io.open(allyIDFile, "w"); if f_out ~= nil then 
			for i, v in pairs(ids) do
				if i ~= ally then f_out:write(i.."\n"); end 
			end
		f_out:close(); end			
	else
		 --  Não há AI aliada: apague.
		if AllyAI ~= 0 then
			if Friends[AllyAI] ~= nil then Friends[AllyAI] = nil; end; AllyAI = 0; 
		end
	end
end
---------------------------------------------------------------------------
AllyAILowHP = false
-----------------------------
function SearchAllyHP(aiType)
---------------------------------------------------------------------------
	
	if (GetTick() < TimerCheckAllyHP) then return; end
	TimerCheckAllyHP = GetTick() + 10000
	
	local failed = false; local ln, nbr1, nbr2; local allyType = 0; local ally = 0; local aCount = 0; local ids = {}
	
	--  Adicionando estado do meu HP para ser encontrado.
	local hpFile = AddIDToPath(FILES[aiType].DANGER_STATE, OwnerID)
	local f_in = io.open(hpFile, "r"); if f_in ~= nil then
		ln = f_in:read(); while (ln ~= nil and aCount < 8) do
			nbr1 = tonumber(ln)
			if nbr1 == nil then failed = true; break; 
			else
				if nbr1 ~= MyID then 
					ids[nbr1] = OwnerID;
				end
			end
		ln = f_in:read(); aCount = aCount + 1; end;
	f_in:close(); end; 
	if failed then 
		Log("falha ao ler arquivo de estado de HP");
		if FileExists(hpFile) then os.remove(hpFile); end
	end; failed = false; 
	
	local f_out = io.open(hpFile, "w"); if f_out ~= nil then 
		if MyHPPerc < MyAggroHPPerc then f_out:write(MyID.."\n"); end
		for i, v in pairs(ids) do
			f_out:write(i.."\n");
		end
	f_out:close(); else TimerCheckAllyHP = TimerCheckAllyHP + 1000; Log("falha ao abrir arquivo de estado de HP"); end; aCount = 0; ids = {};
	
	--  Procurando estado de HP de AI aliada.
	if aiType == 1 then allyType = 2; elseif aiType == 2 then allyType = 1; end; 
	if allyType == 0 then 
		AllyAILowHP = false; 
		return; 
	end; 
	
	local allyHPFile = AddIDToPath(FILES[allyType].DANGER_STATE, OwnerID)
	f_in = io.open(allyHPFile, "r"); if f_in ~= nil then
		ln = f_in:read(); while (ln ~= nil and aCount < 8) do
			
			nbr1 = tonumber(ln)
			if nbr1 == nil then failed = true; break; 
			else
				ids[nbr1] = OwnerID; ally = nbr1; 
			end
			
		ln = f_in:read(); aCount = aCount + 1; end
	f_in:close(); else TimerCheckAllyHP = TimerCheckAllyHP + 1000; --Log("falha ao abrir arquivo de estado de HP de aliados"); 
	end; 
	if failed then
		Log("falha ao ler arquivo de estado de HP de aliados");
		if FileExists(allyHPFile) then os.remove(allyHPFile); end
		AllyAILowHP = false;
	elseif ally > 0 then --  Se encontrou AI aliada: e esta é um valor válido, salvar se está com HP ou não.
		if AllyAI == ally then AllyAILowHP = true; else AllyAILowHP = false; end
		--  Se foi encontrado, apague o valor no arquivo. Assim, só continuará sendo aliado se a outra AI estiver ativa reescrevendo o arquivo.
		f_out = io.open(allyHPFile, "w"); if f_out ~= nil then 
			for i, v in pairs(ids) do
				if i ~= ally then f_out:write(i.."\n"); end 
			end
		f_out:close(); end			
	else
		--  Não há AI aliada: apague.
		AllyAILowHP = false;
	end
end
---------------------------------------------------------------------------
-- ========================================================================
--  COMPORTAMENTO
-- ========================================================================
---------------------------------------------------------------------------
function IsAvailable(skill, cooldown)
---------------------------------------------------------------------------
	if cooldown == nil then cooldown = true; end;
	
	local result = false;
	for slot, values in pairs(Available) do if values.Skill == skill then result = true; break; end; end;
	
	if cooldown then for i, v in pairs(Skills) do if i == skill and Skills[i].Engaged then result = false; break; end; end; end;
return result; end;
---------------------------------------------------------------------------
function IsOKToBeAggro(enemyType)
---------------------------------------------------------------------------
	if
	     enemyType ~= 1555
	and  enemyType ~= 1575
	and  enemyType ~= 1579
	and  enemyType ~= 1589
	and  enemyType ~= 1590
	and (enemyType < 2114 or enemyType > 2125)
	and (enemyType < 2158 or enemyType > 2160)
	and  enemyType ~= 2379
	and  enemyType ~= 2380
	and  enemyType ~= 2308
	then
		return true;
	end;
return false; end
---------------------------------------------------------------------------
function GetSlotOfSkill(skill)
---------------------------------------------------------------------------
	for slot, values in pairs(Available) do if values.Skill == skill then return slot; end; end;
return 0; end;
---------------------------------------------------------------------------
function GetBehavTo(id)
---------------------------------------------------------------------------
	if IsPlayer(id) then 
		if Behavior[id       ] ~= nil then return Behavior[id       ]; end 
	else local enemyType = GetTypeFromID(id);
		if Behavior[enemyType] ~= nil then return Behavior[enemyType]; end 
	end
return "Defensive"; end
---------------------------------------------------------------------------
Behavior      = {}
-----------------------------
OrderBehavior = List.new();
-----------------------------
function LoadBehav(aiType)
---------------------------------------------------------------------------	
	-- Log("aiType: "..aiType)
	-- Log("OwnerID: "..OwnerID)
	if FileExists(AddIDToPath(FILES[aiType].AGGRO_TO_ALL, OwnerID)) then MyBehavior = BEHA_ATTACK; else MyBehavior = BEHA_DEFEND; end
	
	local failed = false; local ln, nbr, behav; local found, lastFound; local bCount = 0;
	local file = AddIDToPath(FILES[aiType].BEHA, OwnerID)
	local f_in = io.open(file, "r"); if f_in ~= nil then 
		ln = f_in:read(); nbr = tonumber(ln); if nbr ~= nil then MyAggroHPPerc = nbr; else failed = true; end
		ln = f_in:read(); while (ln ~= nil and bCount < 50) do
			found = string.find(ln, ".", 1, true); if found ~= nil then
				
				nbr = tonumber(string.sub(ln, 1, found - 1)); if nbr == nil then failed = true; break; end
				
				lastFound = found + 1;
				
				behav = string.sub(ln, lastFound); if behav == nil then failed = true; break; end
				
				if nbr ~= nil and behav ~= nil then Behavior[nbr] = behav; if (not List.containsV2(OrderBehavior, nbr)) then List.pushright(OrderBehavior, nbr); end; end
			else failed = true; break; end
			
			
			
		bCount = bCount + 1; ln = f_in:read(); end
	f_in:close(); end
	if failed then
		Log("erro ao carregar arquivo de comportamento")
		if FileExists(file) then os.remove(file); end
	end
end
---------------------------------------------------------------------------
function SaveBehav(aiType, id, behav)
---------------------------------------------------------------------------
	if id <= 0 then return; end
	if     behav == "Aggressive" then MyAggroHPPerc = MyAggroHPPerc - 10;
	elseif behav == "Defensive"  then MyAggroHPPerc = MyAggroHPPerc + 20; end
	if MyAggroHPPerc > 100 then MyAggroHPPerc = 100; elseif MyAggroHPPerc < 0 then MyAggroHPPerc = 0; end
	
	if IsPlayer(id) then 
		if     Behavior[id] == nil and behav == "Aggressive" then 
			Behavior[id] = behav; List.pushright(OrderBehavior, id); 
			Log("[BEHAVIOUR] agressivo para: "..id)
			
		elseif Behavior[id] ~= nil and behav ~= Behavior[id] then 
			Behavior[id] = nil;   List.removeV2 (OrderBehavior, id); 
			Log("[BEHAVIOUR] defensivo para: "..id)
		end; 
		
	else local enemyType = GetTypeFromID(id); 
		if     Behavior[enemyType] == nil and behav == "Aggressive"        then 
			Behavior[enemyType] = behav; List.pushright(OrderBehavior, enemyType); 
			Log("[BEHAVIOUR] agressivo para: "..enemyType)
			
		elseif Behavior[enemyType] ~= nil and behav ~= Behavior[enemyType] then 
			Behavior[enemyType] = nil;   List.removeV2 (OrderBehavior, enemyType);
			Log("[BEHAVIOUR] defensivo para: "..enemyType) 
		end;
	end
	RefreshBehavFile(aiType)
end
---------------------------------------------------------------------------
function RefreshBehavFile(aiType)
---------------------------------------------------------------------------
	for i, v in pairs(Behavior) do
		if (not List.containsV2(OrderBehavior, i)) then Behavior[i] = nil; end;
	end;
	
	local bCount = List.count(Behavior); 
	if bCount > 50 then --  Se a lista tem 51 membros ou mais.
		for i = 0, (bCount - 50), 1 do --  Limpar os primeiros pra ficar 50.
			local removed = List.popleft(OrderBehavior)
			if (removed) then
				Behavior[removed] = nil
			end
		end
	end; bCount = 0;
	
	local f_out = io.open(AddIDToPath(FILES[aiType].BEHA, OwnerID), "w"); if f_out ~= nil then 
		f_out:write(MyAggroHPPerc.."\n");
		for i = 0, List.count(OrderBehavior), 1 do
			local v = OrderBehavior[i]
			if (v ~= nil and Behavior[v] ~= nil) then
				f_out:write(v.."."..Behavior[v].."\n");
				bCount = bCount + 1; if bCount >= 50 then break; end
			end
		end
	f_out:close(); end
end
---------------------------------------------------------------------------
function LoadSkill(aiType)
---------------------------------------------------------------------------
	local noSkillsFile = AddIDToPath(FILES[aiType].NO_SKILLS, OwnerID)
	local useBuffsFile = AddIDToPath(FILES[aiType].USE_BUFFS, OwnerID)
	if     FileExists(noSkillsFile) then 
		AutoSkills = 0; 
	elseif FileExists(useBuffsFile) then
		AutoSkills = 2; 
	else 
		AutoSkills = 1; 
	end 
	
	local travelFile = AddIDToPath(FILES[aiType].TRAVEL, OwnerID)
	if FileExists(travelFile) then
		UseTravel = true
	else
		UseTravel = false
	end
	
	local noSnipesFile = AddIDToPath(FILES[aiType].NO_SNIPES, OwnerID)
	local noEvadesFile = AddIDToPath(FILES[aiType].NO_EVADES, OwnerID)
	if     FileExists(noSnipesFile) then 
		AutoSnipes = 0; 
	elseif FileExists(noEvadesFile) then 
		AutoSnipes = 2; 
	else
		AutoSnipes = 1; 
	end
	
	local noChasesFile = AddIDToPath(FILES[aiType].NO_CHASES, OwnerID)
	if FileExists(noChasesFile) then 
		LongRangeShooter = true; 
	else 
		LongRangeShooter = false; 
	end
end
---------------------------------------------------------------------------