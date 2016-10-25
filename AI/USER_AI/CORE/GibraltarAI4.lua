---------------------------------------------------------------------------
--  AI Gibraltar Versão 4
---------------------------------------------------------------------------
-- ========================================================================
--  ID
-- ========================================================================
-----------------------------  
--  COMPORTAMENTO
----------------------------- 
MVP_KS_OK               = {}
-- ========================================================================
--  ESTADOS
-- ========================================================================
IDLE_ST	                	= 1
FOLLOW_ST	            	= 2
CHASE_ST	            	= 3
ATTACK_ST	            	= 4
MOVE_CMD_ST	            	= 5
STOP_CMD_ST	            	= 6
ATTACK_OBJECT_CMD_ST		= 7
ATTACK_AREA_CMD_ST	    	= 8
PATROL_CMD_ST	        	= 9
HOLD_CMD_ST	            	= 10
SKILL_OBJECT_CMD_ST	    	= 11
SKILL_AREA_CMD_ST	    	= 12
FOLLOW_CMD_ST	        	= 13

SNIPE_ST	        	    = 14

EVADE_ST	        	    = 15
-- ========================================================================
--  COMANDOS C
-- ========================================================================
MOVE                    	= 1; 
ATTACK                  	= 2; 
SKILL_OBJECT            	= 3; 
SKILL_GROUND            	= 4; 
---------------------------------------------------------------------------
-- ========================================================================
--  VARIÁVEIS GLOBAIS
-- ========================================================================
-----------------------------
--  ESSENCIAIS
-----------------------------
StateTimeOut                = {}
-----------------------------
CCommands               	= List.new()
CCommandsData               = {}
CCommandsData[MOVE]         = {0, -1, -1}
CCommandsData[ATTACK]       = {0, 0}
CCommandsData[SKILL_OBJECT] = {0, 0, 0, 0}
CCommandsData[SKILL_GROUND] = {0, 0, 0, -1, -1}
ResCmdList              	= List.new()    --  ¿¹¾à ¸í·É¾î ¸®½ºÆ® 
TimerToResComChange         = 0
TestClicks                  = 0
-----------------------------
MaxDistance             	= 13            --  Distância máxima de movimento.
NeedToFollow                = false
NeedToGetClose              = false
RandomToGetClose            = false
MovingOutOfScreen           = false
-----------------------------
LongRangeShooter            = false
AutoSkills                  = 1
AutoSnipes                  = 1
UseTravel                   = false
Skills                      = {}
Available                   = {}
Total                       = 0
Round                       = 1
LastRound                   = 1
CheckingSkillState          = -1
CheckingSkillTimer          = 0
CheckingSkill               = 0  --
CheckingSkillLevel          = 0
CheckingSkillTarget         = 0
CheckingSkillX              = 0
CheckingSkillY              = 0 
CastCheck                   = 0
CastBegun                   = false
CastUnbreakable             = false
CastRetry                   = 0
SkillsFailed                = {}
GlobalDelay                 = 0
CountForDelay               = 0
NeedsCastling               = 0
TimerNeedsCastling          = 0
WasHitCastling              = false
WasHit                      = false
Buffed                      = {}
-----------------------------
Actors                      = {}
-----------------------------
Types                       = {}
-----------------------------
PvPHere						= false
-----------------------------
ReactionTimerH              = 9000
ReactionTimerM              = 6000
ReactionTimerL              = 3000
-----------------------------
EnemiesOwnerH               = {} --  MVPs e PvP
EnemiesOwnerM               = {} --  Monstro pode se mover.
EnemiesOwnerL               = {} --  Monstro não se mexe.
EnemiesDefensiveH           = {}
EnemiesDefensiveM           = {}
EnemiesDefensiveL           = {}
EnemiesFriendsH             = {}
EnemiesFriendsM             = {}
EnemiesFriendsL             = {}
EnemiesAggressiveH          = {}
EnemiesAggressiveM          = {}
EnemiesAggressiveL          = {}
Targets                     = {}
EnemiesInvisible            = {}
-----------------------------  
--  COMPORTAMENTO
----------------------------- 
CanDoKS                 	= 0
Unreachable             	= {}
MyBehavior                  = BEHA_DEFEND
MyAggroHPPerc               = 80

MyEvadeHPPerc               = 60

MySPToBuff                  = 55
-----------------------------
--  HOMUNCULUS
-----------------------------  
MyID                    	= 0             --  È£¹®Å¬·ç½º id
MySP                    	= 0
MyMaxSP                 	= 0
MySPPerc                 	= 0
MyHP                    	= 0
MyMaxHP                 	= 0
MyHPPerc                 	= 0
MyMotion                	= 0
MyX                     	= -1
MyY                     	= -1
MyTarget                	= 0             
-----------------------------
MyState                 	= IDLE_ST       --  ÃÖÃÊÀÇ »óÅÂ´Â ÈÞ½Ä
MyStateBeforeCommand        = IDLE_ST
MyAttackRange           	= 1
MyDestX                 	= -1            --  ¸ñÀûÁö x
MyDestY                 	= -1            --  ¸ñÀûÁö y
MyDestIsMyPos               = false
MyPatrolX               	= -1            --  Á¤Âû ¸ñÀûÁö x
MyPatrolY               	= -1            --  Á¤Âû ¸ñÀûÁö y
MyEnemy                 	= 0             --  Àû id
MySecondaryEnemy            = 0
MyNearestEnemy              = 0
MyNearestEnemyDis           = 0
MyInvisibleEnemy            = 0
MyInvisibleEnemyI           = 0
MySkill       				= 0; 
MySkillLevel  				= 0
MySkillTargetIsAlive        = 0
MySkillTarget 				= 0
MyAreaSkill		            = 0
MyAreaSkillLevel            = 0
MyAreaSkillDestIsMyPos      = false
MyAreaSkillDestX            = -1
MyAreaSkillDestY            = -1 
MyNextSkill                 = 0  --  Combo
MyNextSkillTimer            = 0  --  
MyNextSkillLevel            = 0
MyNextSkillTarget           = 0
MyNextSkillX                = 0
MyNextSkillY                = 0 
MySPBeforeSkill         	= 0
MyHPBeforeSkill         	= 0
MyStyle                     = STYLE_FIGHT

MySnipeSkill   				= 0; 
MySnipeSkillLevel  			= 0
MySnipeTarget 				= 0
MySnipeDestX   				= -1 
MySnipeDestY   				= -1; 

MoveCommanded               = false
CannotMove                  = false
CountCycles                 = 0

StopSnipeNow = false
-----------------------------  
LastMyID                	= 0             --  È£¹®Å¬·ç½º id
LastMySP                	= 0
LastMyMaxSP             	= 0
LastMySPPerc             	= 0
LastMyHP                	= 0
LastMyMaxHP             	= 0
LastMyHPPerc             	= 0
LastMyMotion            	= 0
LastMyX                 	= -1
LastMyY                 	= -1
LastMyTarget            	= 0             
-----------------------------
LastMyState             	= IDLE_ST       --  ÃÖÃÊÀÇ »óÅÂ´Â ÈÞ½Ä
LastMyAttackRange       	= 1
LastMyDestX             	= -1            --  ¸ñÀûÁö x
LastMyDestY             	= -1            --  ¸ñÀûÁö y
LastMyPatrolX           	= -1            --  Á¤Âû ¸ñÀûÁö x
LastMyPatrolY           	= -1            --  Á¤Âû ¸ñÀûÁö y
LastMyEnemy             	= 0             --  Àû id
LastMySPBeforeSkill     	= 0
LastMyHPBeforeSkill     	= 0
-----------------------------  
BygoneMyID                	= 0             --  È£¹®Å¬·ç½º id
BygoneMySP                	= 0
BygoneMyMaxSP             	= 0
BygoneMySPPerc             	= 0
BygoneMyHP                	= 0
BygoneMyMaxHP             	= 0
BygoneMyHPPerc             	= 0
BygoneMyMotion            	= 0
BygoneMyX                 	= -1
BygoneMyY                 	= -1
BygoneMyTarget            	= 0             
-----------------------------
BygoneMyState             	= IDLE_ST       --  ÃÖÃÊÀÇ »óÅÂ´Â ÈÞ½Ä
BygoneMyAttackRange       	= 1
BygoneMyDestX             	= -1            --  ¸ñÀûÁö x
BygoneMyDestY             	= -1            --  ¸ñÀûÁö y
BygoneMyPatrolX           	= -1            --  Á¤Âû ¸ñÀûÁö x
BygoneMyPatrolY           	= -1            --  Á¤Âû ¸ñÀûÁö y
BygoneMyEnemy             	= 0             --  Àû id
BygoneMySPBeforeSkill     	= 0
BygoneMyHPBeforeSkill     	= 0
-----------------------------
--  MESTRE
-----------------------------  
OwnerID                 	= 0
OwnerSP                 	= 0
OwnerMaxSP              	= 0
OwnerSPPerc               	= 0
OwnerHP                 	= 0
OwnerMaxHP              	= 0
OwnerHPPerc               	= 0
OwnerMotion             	= 0
OwnerX                  	= -1
OwnerY                  	= -1
OwnerTarget             	= 0
-----------------------------
OwnerPosChanged         	= false
OwnerNearerOrFarther    	= 0
OwnerMovementMarkX      	= 0
OwnerMovementMarkY      	= 0
-----------------------------  
LastOwnerID                 = 0
LastOwnerSP                 = 0
LastOwnerMaxSP              = 0
LastOwnerSPPerc             = 0
LastOwnerHP                 = 0
LastOwnerMaxHP              = 0
LastOwnerHPPerc             = 0
LastOwnerMotion             = 0
LastOwnerX                  = -1
LastOwnerY                  = -1
LastOwnerTarget             = 0
-----------------------------
LastOwnerPosChanged         = false
LastOwnerNearerOrFarther    = 0
LastOwnerMovementMarkX      = 0
LastOwnerMovementMarkY      = 0
-----------------------------  
BygoneOwnerID               = 0
BygoneOwnerSP               = 0
BygoneOwnerMaxSP            = 0
BygoneOwnerSPPerc           = 0
BygoneOwnerHP               = 0
BygoneOwnerMaxHP            = 0
BygoneOwnerHPPerc           = 0
BygoneOwnerMotion           = 0
BygoneOwnerX                = -1
BygoneOwnerY                = -1
BygoneOwnerTarget           = 0
-----------------------------
BygoneOwnerPosChanged       = false
BygoneOwnerNearerOrFarther  = 0
BygoneOwnerMovementMarkX    = 0
BygoneOwnerMovementMarkY    = 0
-----------------------------  
--  OUTROS
----------------------------- 
Motions                     = {}
LastMotions                 = {}
BygoneMotions               = {}
AnyoneCouldMove             = false; 
BypassMoveFilter            = false; 

OwnerAFK                    = false
TimerDetectAFK              = 0

IgnoreNextMovement          = false

IgnoreCastlingReDo          = false
---------------------------------------------------------------------------
-- ========================================================================
--  UPDATE
-- ========================================================================
---------------------------------------------------------------------------
Started                 	= false
DelayToRefreshBehav         = 0
----------------------------- 
clock_start = GetTick(); clock_end = GetTick(); time_execution = 0; response = 0; delay = 0;
SkippedOneLoop          	= true
----------------------------- 
function AI_Sec(myID)
---------------------------------------------------------------------------
	
	clock_start = GetTick(); response = clock_start - clock_end; 
	
	if (not Started) then
		if     Homun ~= nil then 
			AIType = 1; Log("[INIT] sou um homunculus do tipo "..Homun.."."); 
		elseif Merce ~= nil then 
			AIType = 2; Log("[INIT] sou um assistente do tipo "..Merce.."."); 
		end
		
		TimerToUseSkill = GetTick() + 1000
		TimerDetectAFK  = GetTick() + 5000
		TimerToReact    = GetTick() + 500
		
		TimerToBypassSkillError = GetTick() + 30000
		Move_Std        = Move;        Move        = Move_Sec;         --  Substituir Move        pela versão protegida.
		Attack_Std      = Attack;      Attack      = Attack_Sec;       --  Substituir Attack      pela versão protegida.
		SkillObject_Std = SkillObject; SkillObject = SkillObject_Sec;  --  Substituir SkillObject pela versão protegida.
		SkillGround_Std = SkillGround; SkillGround = SkillGround_Sec;  --  Substituir SkillGround pela versão protegida.
		
		GetFreshValues(myID);
		SaveLastValues(myID);
		
		--  Verificar habilidades disponíveis para o tipo de homunculus ou assistente.
		local success, fail = pcall(GetAvailableSkills, AIType); if not success and fail ~= nil then pcall(Log, fail); end;
		
		Started = true;
	else
		SaveLastValues(myID);
		GetFreshValues(myID);
	end;
				
	LoadSkill(AIType);
	if (GetTick() > DelayToRefreshBehav) then
		LoadBehav(AIType); 
	end
	LoadFriends(AIType); 
	
	--  Realizar e processar comandos do usuário.
	local msg  = GetMsg(myID)    --  Command.
	local rmsg = GetResMsg(myID) --  Reserved command.
	
	if msg[1] == NONE_CMD then
		if rmsg[1] ~= NONE_CMD then
			
			--  Trocar comandos reservados por algo útil: para usar habilidades de área de Eira, Sera ou Dieter, 
			-- em que o comando está com problema no jogo e não transmite informação nenhuma para a AI.
			local special = false; local processNow = false; 
			if     (rmsg[1] == MOVE_CMD         ) then 
				if Homun ~= nil then
					if Homun == DIETER or Homun == EIRA or Homun == SERA then special = true;
						rmsg[1] = SKILL_AREA_CMD;
						rmsg[4] = rmsg[2];
						rmsg[5] = rmsg[3];
					end;
				end;
			elseif (rmsg[1] == ATTACK_OBJECT_CMD) then 
				if Homun ~= nil then
					if Homun == DIETER or Homun == EIRA or Homun == SERA then special = true;
						local skillX, skillY = GetV(V_POSITION, rmsg[2]);
						rmsg[1] = SKILL_AREA_CMD;
						rmsg[4] = skillX;
						rmsg[5] = skillY;
					end;
				end;
			end;
			
			if special then
				if TimerToResComChange ~= 0 then
					if GetTick() > TimerToResComChange then
						TimerToResComChange = 0; TestClicks = 0;
					end;
				elseif TestClicks >= 2 or MyState ~= SKILL_AREA_CMD_ST then
						TimerToResComChange = 0; TestClicks = 0; 
				end;
				if     Homun == DIETER then
					if (TestClicks < 1) then
						rmsg[2] = 5;
						rmsg[3] = 8043;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 1.");
					else
						rmsg[2] = 5;
						rmsg[3] = 8041;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 2.");
					end;
					processNow = true;
				elseif Homun == EIRA   then
					if (TestClicks < 1) then
						rmsg[2] = 1;
						rmsg[3] = 8025;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 3.");
					else
						rmsg[2] = 5;
						rmsg[3] = 8025;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 4.");
					end;
					processNow = true;
				elseif Homun == SERA   then
					if (TestClicks < 1) then
						rmsg[2] = 1;
						rmsg[3] = 8020;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 5.");
					else
						rmsg[2] = 5;
						rmsg[3] = 8020;
						
						TestClicks = TestClicks + 1; Log("comando especial de área, 6.");
					end;
					processNow = true;
				end;
			end
				
			if processNow then TimerToResComChange = GetTick() + 1500;
				List.clear(ResCmdList); ProcessCommand(rmsg)
			else
				if List.size(ResCmdList) < 10 then
					List.pushright(ResCmdList, rmsg) -- ?? ?? ??
				end
			end
		end
	else
		List.clear(ResCmdList)	-- ??? ??? ???? ?? ???? ????.  
		ProcessCommand(msg)	-- ??? ?? 
	end
	
	
	
	if (MyEnemy > 0) then
		if (Motions[MyEnemy] == MOTION_HIT) then
			IgnoreDead = GetTick() + 1000
		end
		if (IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
			IgnoreDead = GetTick() + 3000
			TimerToChangeTarget = 0;
		elseif (IsKS(MyEnemy)) then
			TimerToChangeTarget = 0
		end
	end
	if (GetTick() > IgnoreDead) then IgnoreDead = 0; end
	
	Actors = GetActors(); UpdateMotions(); 
		
	UpdateEnemiesAndAllies();
	
	DetectPvP(myID); 
	DetectOwnerDirection()
	DetectSkillUse()
	
	if ((NeedsCastling > 0 and GetTick() > NeedsCastling) or OwnerPosChanged or OwnerMotion == MOTION_MOVE) then
		NeedsCastling = 0
		TimerNeedsCastling = 0
	elseif (NeedsCastling < 0 and TimerNeedsCastling == 0) then 
		TimerNeedsCastling = GetTick() + 2000
	elseif (TimerNeedsCastling ~= 0 and GetTick() > TimerNeedsCastling) then
		NeedsCastling = 0
		TimerNeedsCastling = 0
	end
	
	local distance = GetDistance2(OwnerID, MyID)
	NeedToFollow   = ShouldFollow(MyState, distance)
	if (OwnerPosChanged and OwnerNearerOrFarther == 1) then
		NeedToGetClose = true
	end
	
	if (MyMotion == MOTION_HIT) then
		WasHitCastling              = true

		WasHit                      = true
	end
	
	if (OwnerPosChanged 
	or IsAttacking(OwnerID)
	--or IsUsingSkill(OwnerID) --  (Pode ser autoconjuração...)
	) then
		TimerDetectAFK = GetTick() + 60000
		if (OwnerAFK) then Log("owner not AFK anymore..."); end
		OwnerAFK = false;
	elseif (not OwnerAFK and GetTick() > TimerDetectAFK) then
		Log("owner AFK...")
		OwnerAFK = true
	end
	
	if MyState == SNIPE_ST or MyState == EVADE_ST then
		if (((MyX == BygoneMyX and MyY == BygoneMyY) or (MyX == LastMyX and MyY == LastMyY)) and MyMotion ~= MOTION_MOVE and LastMyMotion == MOTION_MOVE) then
			StopSnipeNow = true
		end
	end
	--Log("delay: "..delay);
		
	local testingMovement = false
	if (MoveCommanded) then
		MoveCommanded = false
		if     (SentX == MyX and SentY == MyY and MyMotion ~= MOTION_MOVE) then
			CannotMove = false
			Log("sistema OK e sem 'lag'. Consegui parar de me mover.")
		elseif (SentX == MyX and SentY == MyY and MyMotion == MOTION_MOVE) then
			CannotMove = true
			Log("'Lag'!!! Não consegui parar de me mover!")
		elseif (MyMotion ~= MOTION_MOVE) then
			CannotMove = true
			Log("'Lag'!!! Não consigo me mover!")
		else
			CannotMove = false
			Log("sistema OK e sem 'lag'. Consegui me mover normalmente.")
		end
		
		testingMovement = true
	end
	--if (delay <= 200 or SkippedOneLoop) then
	local skipDelay = false;
	if     (MyState == CHASE_ST and MyEnemy > 0) then
		if (not IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
			if (IsInAttackSight(MyID, MyEnemy)) then
				skipDelay = true
			end
		end
	elseif (MyState == ATTACK_ST) then
		if (not IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
			if (not IsInAttackSight(MyID, MyEnemy)) then
				skipDelay = true
			end
		end
	elseif ((MyState == CHASE_ST or MyState == ATTACK_ST) and (CurX ~= LastX or CurY ~= LastY)) then
		skipDelay = true
		
	elseif GetDistance2(MyID, OwnerID) > MaxDistance then
		skipDelay = true
	end
	
	--  Atualizar movimento do inimigo/alvo.
	--LastIDMoved = false
	LastX = CurX;
	LastY = CurY;
	LastDeltaX = DeltaX
	LastDeltaY = DeltaY
	if (LastID ~= 0 and LastIDIsCurrentID) then
		if (Motions[LastID] == MOTION_MOVE or LastMotions[LastID] == MOTION_MOVE or BygoneMotions[LastID] == MOTION_MOVE) then
			LastIDMoved = true
		end
	end
	
	if BlockDistance2(MyID, OwnerID) > MaxDistance then
		MovingOutOfScreen = true
		MyDestX, MyDestY = RepairDest(MyID, MyDestX, MyDestY); Move(MyID, MyDestX, MyDestY, true)
	end
	if (not CannotMove 
	
	or MovingOutOfScreen
	
	or skipDelay
	
	or --(
		((MyX ~= LastMyX or MyY ~= LastMyY or BygoneMyX ~= LastMyX or BygoneMyY ~= LastMyY) and (not testingMovement))
		
	) then
		--CannotMove  = false
		CountCycles = 0
		--if (LastID ~= 0) then
			if (LastIDIsCurrentID) then 
				CurX, CurY = GetV(V_POSITION, LastID);
				if (LastX == -1) then LastX = CurX; end
				if (LastY == -1) then LastY = CurY; end
				DeltaX = math.floor(CurX - LastX); 
				DeltaY = math.floor(CurY - LastY)
			else
				CurX, CurY = -1, -1;
				LastX = CurX;
				LastY = CurY;
				DeltaX = 0
				DeltaY = 0
				LastDeltaX = 0
				LastDeltaY = 0
			end
		--end
		LastIDIsCurrentID = false;
		
		if     (MyState == IDLE_ST             ) then
			OnIDLE_ST();
		elseif (MyState == FOLLOW_ST           ) then
			OnFOLLOW_ST()
		elseif (MyState == CHASE_ST            ) then
			OnCHASE_ST();
		elseif (MyState == ATTACK_ST           ) then
			OnATTACK_ST();
		elseif (MyState == MOVE_CMD_ST         ) then
			OnMOVE_CMD_ST()
		elseif (MyState == SKILL_OBJECT_CMD_ST ) then
			OnSKILL_OBJECT_CMD_ST()
		elseif (MyState == SKILL_AREA_CMD_ST   ) then
			OnSKILL_AREA_CMD_ST()
		elseif (MyState == FOLLOW_CMD_ST       ) then
			OnFOLLOW_CMD_ST()
			
		elseif (MyState == SNIPE_ST            ) then
			OnSNIPE_ST();
			
		elseif (MyState == EVADE_ST            ) then
			OnEVADE_ST();
			
		else
			MyState = IDLE_ST
			OnIDLE_ST();
		end;
		NeedToFollow   = false;
		NeedToGetClose = false;
		
		StopSnipeNow   = false
		
		WasHit         = false
		
		AnyoneCouldMove = false; 
		
		LastIDMoved = false
		if (LastMyState ~= MyState) then
			RestartState(MyState)
		end;
		ProcessCCalls(); 
	--	SkippedOneLoop = false;
	elseif (CountCycles > 1) 	
	or MyMotion == MOTION_MOVE 
		--and not testingMovement
		--)
	or (SentX == MyX and SentY == MyY and MyMotion ~= MOTION_MOVE)
	then
		CannotMove  = false
		CountCycles = 0
	--	SkippedOneLoop = true;
	else
		CountCycles = CountCycles + 1
	end;
	
	clock_end = GetTick(); time_execution = clock_end - clock_start; delay = (response) + (time_execution); 
end;
---------------------------------------------------------------------------
UseCaprice              = true
UseEleanorTinderBreaker = true
UseEiraEraseCutter      = true
UseEiraXenoSlasher      = true
UseEiraSilentBreeze     = true
UseBayeriStahlHorn      = true
UseBayeriHailegeStar    = true
UseSeraParalyze         = true
UseSeraSummonLegion     = true
UseSeraPoisonMist       = true
UseDieterLavaSlide      = true
----------------------------- 
function GetFreshValues(myID)
---------------------------------------------------------------------------
	if     Homun ~= nil then 
		local success; local homun = 0; success, homun = pcall(GetMyType, myID)
		if not success and homun ~= nil then pcall(Log, homun); else Homun = homun; end
	elseif Merce ~= nil then 
		local success; local merce = 0; success, merce = pcall(GetMyType, myID)
		if not success and merce ~= nil then pcall(Log, merce); else Merce = merce; end
	end
		
	if GetV(V_SKILLATTACKRANGE, myID, 8013) > 1 then --  Tenho Capricho!
		UseCaprice = true
	else
		UseCaprice = false
	end
	
	if GetV(V_SKILLATTACKRANGE, myID, 8024) == 1 then
		UseEiraEraseCutter   = false
	else
		UseEiraEraseCutter   = true
	end
	if GetV(V_SKILLATTACKRANGE, myID, 8025) == 1 then -- 
		UseEiraXenoSlasher   = false
	else
		UseEiraXenoSlasher   = true
	end
	if GetV(V_SKILLATTACKRANGE, myID, 8026) == 1 then -- 
		UseEiraSilentBreeze  = false
	else
		UseEiraSilentBreeze  = true
	end
	
	if GetV(V_SKILLATTACKRANGE, myID, 8031) == 1 then 
		UseBayeriStahlHorn   = false
	else
		UseBayeriStahlHorn   = true
	end
	if GetV(V_SKILLATTACKRANGE, myID, 8034) == 1 then
		UseBayeriHailegeStar = false
	else
		UseBayeriHailegeStar = true
	end
	
	if GetV(V_SKILLATTACKRANGE, myID, 8018) == 1 then 
		UseSeraSummonLegion  = false
	else
		UseSeraSummonLegion  = true
	end
	if GetV(V_SKILLATTACKRANGE, myID, 8019) == 1 then
		UseSeraParalyze      = false
	else
		UseSeraParalyze      = true
	end
	if GetV(V_SKILLATTACKRANGE, myID, 8020) == 1 then 
		UseSeraPoisonMist    = false
	else
		UseSeraPoisonMist    = true
	end
	
	if GetV(V_SKILLATTACKRANGE, myID, 8041) == 1 then
		UseDieterLavaSlide   = false
	else
		UseDieterLavaSlide   = true
	end
		
	if GetV(V_SKILLATTACKRANGE, myID, 8036) == 1 then
		UseEleanorTinderBreaker = false
	else
		UseEleanorTinderBreaker = true
	end
		
	MyID                    		= myID
	MySP                    		= GetV(V_SP, MyID         )
	MyMaxSP                 		= GetV(V_MAXSP, MyID      )
	MySPPerc               	  		= (MySP / MyMaxSP) * 100
	MyHP                    		= GetV(V_HP, MyID         )
	MyMaxHP                 		= GetV(V_MAXHP, MyID      )
	MyHPPerc               	  		= (MyHP / MyMaxHP) * 100
	MyMotion                		= GetV(V_MOTION, MyID     )
	MyX, MyY                		= GetV(V_POSITION, MyID   )
	MyTarget                		= GetV(V_TARGET, MyID     )
	
	MyAttackRange           		= GetV(V_ATTACKRANGE, MyID)
	
	OwnerID                 		= GetV(V_OWNER, OwnerID   )
	OwnerSP                 		= GetV(V_SP, OwnerID      )
	OwnerMaxSP              		= GetV(V_MAXSP, OwnerID   )
	OwnerSPPerc               	    = (OwnerSP / OwnerMaxSP) * 100
	OwnerHP                 		= GetV(V_HP, OwnerID      )
	OwnerMaxHP              		= GetV(V_MAXHP, OwnerID   )
	OwnerHPPerc               	    = (OwnerHP / OwnerMaxHP) * 100
	OwnerMotion             		= GetV(V_MOTION, OwnerID  )
	OwnerX, OwnerY          		= GetV(V_POSITION, OwnerID)
	OwnerTarget             		= GetV(V_TARGET, OwnerID  )
end;
---------------------------------------------------------------------------
function SaveLastValues(myID)
---------------------------------------------------------------------------
	
	BygoneMyID                		= LastMyID  
	BygoneMySP                		= LastMySP 
	BygoneMyMaxSP             		= LastMyMaxSP
	BygoneMySPPerc                	= LastMySPPerc 
	BygoneMyHP                		= LastMyHP 
	BygoneMyHPPerc                	= LastMyHPPerc 
	BygoneMyMaxHP             		= LastMyMaxHP
	BygoneMyMotion            		= LastMyMotion
	BygoneMyX                 		= LastMyX 
	BygoneMyY                 		= LastMyY
	BygoneMyTarget            		= LastMyTarget             
	-----------------------------
	BygoneMyState             		= LastMyState
	BygoneMyAttackRange       		= LastMyAttackRange
	BygoneMyDestX             		= LastMyDestX
	BygoneMyDestY             		= LastMyDestY  
	BygoneMyPatrolX           		= LastMyPatrolX
	BygoneMyPatrolY           		= LastMyPatrolY 
	BygoneMyEnemy             		= LastMyEnemy
	BygoneMySPBeforeSkill     		= LastMySPBeforeSkill
	BygoneMyHPBeforeSkill     		= LastMyHPBeforeSkill
	
	LastMyID                		= MyID  
	LastMySP                		= MySP 
	LastMyMaxSP             		= MyMaxSP
	LastMySPPerc                	= MySPPerc 
	LastMyHP                		= MyHP 
	LastMyMaxHP             		= MyMaxHP
	LastMyHPPerc                	= MyHPPerc 
	LastMyMotion            		= MyMotion
	LastMyX                 		= MyX 
	LastMyY                 		= MyY
	LastMyTarget            		= MyTarget             
	-----------------------------
	LastMyState             		= MyState
	LastMyAttackRange       		= MyAttackRange
	LastMyDestX             		= MyDestX
	LastMyDestY             		= MyDestY  
	LastMyPatrolX           		= MyPatrolX
	LastMyPatrolY           		= MyPatrolY 
	LastMyEnemy             		= MyEnemy
	LastMySPBeforeSkill     		= MySPBeforeSkill
	LastMyHPBeforeSkill     		= MyHPBeforeSkill
	
	BygoneOwnerID                 	= LastOwnerID
	BygoneOwnerSP                 	= LastOwnerSP
	BygoneOwnerMaxSP              	= LastOwnerMaxSP
	BygoneOwnerSPPerc              	= LastOwnerSPPerc 
	BygoneOwnerHP                 	= LastOwnerHP
	BygoneOwnerMaxHP              	= LastOwnerMaxHP
	BygoneOwnerHPPerc              	= LastOwnerHPPerc 
	BygoneOwnerMotion             	= LastOwnerMotion 
	BygoneOwnerX                  	= LastOwnerX
	BygoneOwnerY                  	= LastOwnerY
	BygoneOwnerTarget             	= LastOwnerTarget
	-----------------------------
	BygoneOwnerPosChanged         	= LastOwnerPosChanged
	BygoneOwnerNearerOrFarther    	= LastOwnerNearerOrFarther
	BygoneOwnerMovementMarkX      	= LastOwnerMovementMarkX
	BygoneOwnerMovementMarkY      	= LastOwnerMovementMarkY
	
	LastOwnerID                   	= OwnerID
	LastOwnerSP                   	= OwnerSP
	LastOwnerMaxSP                	= OwnerMaxSP
	LastOwnerSPPerc              	= OwnerSPPerc 
	LastOwnerHP                   	= OwnerHP
	LastOwnerMaxHP                	= OwnerMaxHP
	LastOwnerHPPerc              	= OwnerHPPerc 
	LastOwnerMotion               	= OwnerMotion 
	LastOwnerX                    	= OwnerX
	LastOwnerY                    	= OwnerY
	LastOwnerTarget               	= OwnerTarget
	-----------------------------
	LastOwnerPosChanged           	= OwnerPosChanged
	LastOwnerNearerOrFarther      	= OwnerNearerOrFarther
	LastOwnerMovementMarkX        	= OwnerMovementMarkX
	LastOwnerMovementMarkY        	= OwnerMovementMarkY
end;
---------------------------------------------------------------------------
-- ========================================================================
--  COMANDOS C PROTEGIDOS
-- ========================================================================
---------------------------------------------------------------------------
TimerToBypassSkillError = 0
----------------------------- 
function ProcessCCalls() 
---------------------------------------------------------------------------
	--  TODO: agora, processar o comando, dependendo do tipo.
	--  Cancelar funções se por exemplo o inimigo morreu ou não tem mais SP disponível.
	local nextCommand;
	local count = 1;
	while (List.size(CCommands) > 0 and count <= 4) do
		nextCommand = List.popleft(CCommands);
		if     (nextCommand == MOVE        ) then
			local myID 	= CCommandsData[nextCommand][1];
			local x 	= CCommandsData[nextCommand][2];
			local y 	= CCommandsData[nextCommand][3];
			if (MyDestIsMyPos) then
				x, y = RepairDest(myID, GetV(V_POSITION, MyID))
			else
				x, y = RepairDest(myID, x, y)
			end
			MyDestIsMyPos = false
			if (Move_Lim(myID, x, y)) then
				MovingOutOfScreen = false
				SentX = x;
				SentY = y;
				Log("[MOVE] processar");
				MoveCommanded = true
				Move_Std(myID, x, y)
				break;
			end;
			
		elseif (nextCommand == ATTACK      ) then
			local myID	= CCommandsData[nextCommand][1];
			local enemy = CCommandsData[nextCommand][2];
			if (Attack_Lim(myID, enemy)) then
				Log("[ATTACK] processar");
				Attack_Std(myID, enemy)
				break;
			end;
			
		elseif (nextCommand == SKILL_OBJECT) then
			TimerToBypassSkillError = GetTick() + 30000
			local myID	= CCommandsData[nextCommand][1];
			local level	= CCommandsData[nextCommand][2];
			local skill	= CCommandsData[nextCommand][3];
			local id	= CCommandsData[nextCommand][4];
			DoneSkill = true; DoneSnipeSkill = true;
			CastCheck          = 0
			CheckingSkillState = -1
			if (SkillObject_Lim(myID, level, skill, id)) then
				Log("[SKILL OBJECT] processar");
				MyHPBeforeSkill = MyHP
				MySPBeforeSkill = MySP
				--RegisterCooldown(skill, level, id, -1, -1)
				
				CheckingSkillState          = 1
				CheckingSkill               = skill
				CheckingSkillLevel          = level
				CheckingSkillTarget         = id
				CheckingSkillX              = -1
				CheckingSkillY              = -1 
				
				CastCheck          = GetTick() + 250
				if (CheckingSkill == 8040 or CheckingSkill == 8042) then
					CastUnbreakable    = true
				else
					CastUnbreakable    = false
				end
				
				SkillObject_Std(myID, level, skill, id)
				break;
			end;
		elseif (nextCommand == SKILL_GROUND) then
			TimerToBypassSkillError = GetTick() + 30000
			local myID	= CCommandsData[nextCommand][1];
			local level	= CCommandsData[nextCommand][2];
			local skill	= CCommandsData[nextCommand][3];
			local x		= CCommandsData[nextCommand][4];
			local y		= CCommandsData[nextCommand][5];
			DoneAreaSkill = true;
			if (MyAreaSkillDestIsMyPos) then
				x, y = GetV(V_POSITION, MyID)
			else
				--x, y = RepairDest(myID, x, y)
			end
			MyAreaSkillDestIsMyPos = false
			CastCheck          = 0
			CheckingSkillState = -1
			if (SkillGround_Lim(myID, level, skill, x, y)) then
				Log("[SKILL GROUND] processar");
				MyHPBeforeSkill = MyHP
				MySPBeforeSkill = MySP
				--RegisterCooldown(skill, level, 0, x, y)
				
				CheckingSkillState          = 1
				CheckingSkill               = skill
				CheckingSkillLevel          = level
				CheckingSkillTarget         = 0
				CheckingSkillX              = x
				CheckingSkillY              = y 
				
				CastCheck          = GetTick() + 250
				CastUnbreakable    = true
				
				SkillGround_Std(myID, level, skill, x, y)
				break;
			end;
			
		end;
		count = count + 1;
	end;
	if (GetTick() > TimerToBypassSkillError) then
		
		TimerToBypassSkillError = 0
	end
	if (TimerToBypassSkillError == 0) then
		GlobalDelay        = 0
		CastCheck          = 0
		CheckingSkillState = -1
		TimerToBypassSkillError = GetTick() + 30000
		Round = 1
	end
end;
---------------------------------------------------------------------------
function Call(command, p1, p2, p3, p4, p5)
---------------------------------------------------------------------------
	if (not List.containsV2(CCommands, command)) then
		--Log("adicionando comando: "..command);
		--CCommands[List.size(CCommands)] = command;
		List.pushright(CCommands, command);
	end;
	CCommandsData[command] = {p1, p2, p3, p4, p5};
	--Log("List.size(CCommands): "..List.size(CCommands));
	--Log("List.count(CCommands): "..List.count(CCommands));
	--Log("List.count2(CCommands): "..List.count2(CCommands));
end;
---------------------------------------------------------------------------
function PriorityCall(command, p1, p2, p3, p4, p5)
---------------------------------------------------------------------------
	if (MovingOutOfScreen and command ~= MOVE) then
		Call(command, p1, p2, p3, p4, p5)
		return;
	end
	List.removeV2(CCommands, command, true);
	--Log("adicionando comando prioritário: "..command);
	--CCommands[List.size(CCommands)] = command;
	List.pushleft(CCommands, command);
	CCommandsData[command] = {p1, p2, p3, p4, p5};
end
---------------------------------------------------------------------------
function RemoveCall(command)
---------------------------------------------------------------------------
	List.removeV2(CCommands, command, true);
	--Log("adicionando comando prioritário: "..command);
	--CCommands[List.size(CCommands)] = command;
end
--------------------------------------------------------------------------- 
function Move_Sec(myID, x, y, priority)
---------------------------------------------------------------------------
	if (priority == nil) then priority = false; end;
	
	if (x == MyX and y == MyY) and (MyMotion ~= MOTION_MOVE) then
		RemoveCall(MOVE)
	end;
	
	if (not Move_Lim(myID, x, y)) then 
		return false;
	end;
	
	if (x == MyX and y == MyY) then
		MyDestIsMyPos = true
	else
		MyDestIsMyPos = false
	end;
	-- SentX = -1;
	-- SentY = -1;
	if (priority) then
		PriorityCall(MOVE, myID, x, y);
	else
		Call(MOVE, myID, x, y);
	end;
return true; end;
---------------------------------------------------------------------------
SentX = -1;
SentY = -1;
-----------------------------
function Move_Lim(myID, x, y)
---------------------------------------------------------------------------
	if (MovingOutOfScreen) then return true; end;
	if (MyMotion == MOTION_MOVE and SentX == x and SentY == y) then
		Log("[MOVE] não permitido: comando já enviado e em processo");
		return false;
	end;
	if (NeedsCastling ~= 0) then 
		Log("[MOVE] não permitido: verificando uso de Troca de Lugar, que pode bug'ar a posição do mestre");
		return false;
	end
	if (BlockDistance(OwnerX, OwnerY, x, y) > MaxDistance) then
		Log("[MOVE] não permitido: fora da tela");
		return false;
	end;
	if (x == MyX and y == MyY) and (MyMotion ~= MOTION_MOVE) then
		Log("[MOVE] não permitido: tentando me mover para a posição em que estou"); 
		return false;
	end;
return true; end;
---------------------------------------------------------------------------
LastTargetType = 0;
-----------------------------
function Attack_Sec(myID, enemy, priority)
---------------------------------------------------------------------------
	if (priority == nil) then priority = false; end;
	
	if (not Attack_Lim(myID, enemy)) then 
		return false;
	end;
	
	if (priority) then
		PriorityCall(ATTACK, myID, enemy);
	else
		Call(ATTACK, myID, enemy);
	end;
return true; end;
---------------------------------------------------------------------------
function Attack_Lim(myID, enemy)
---------------------------------------------------------------------------
	if (myID ==  0 or enemy ==  0) then 
		Log("[ATTACK] não permitido: valores inválidos (nulos)");
	return false; end;
	if (myID == -1 or enemy == -1) then 
		Log("[ATTACK] não permitido: valores inválidos (negativos)");
	return false; end;
	
	local enemyType = GetTypeFromID(enemy);
	-- if (Merce == nil) then
		if (enemyType == 0 and LastTargetType ~= 0) then
			Log("[ATTACK] não permitido: inimigo morreu e seu tipo foi reiniciado para 0");
			return false; 
		end
	-- end
	LastTargetType = enemyType
	
	if GetV(V_MOTION, enemy) == MOTION_DEAD then 
		Log("[ATTACK] não permitido: inimigo morto");
		return false; 
	end
	if (IsOutOfSight(GetV(V_TARGET, enemy), enemy)) then
		Log("[ATTACK] não permitido: fora do tela");
		return false;
	end
	-- if not IsInAttackSight(myID, enemy) then 
		-- Log("[ATTACK] não permitido: fora do alcance");
		-- return false; 
	-- end
return true; end;
---------------------------------------------------------------------------
LastSkillTargetType = 0;
-----------------------------
function SkillObject_Sec(myID, level, skill, id)
---------------------------------------------------------------------------
	
	MySkillTargetIsAlive = false;
	if (GetV(V_MOTION, id) ~= MOTION_DEAD) then
		MySkillTargetIsAlive = true;
	end
	if (not SkillObject_Lim(myID, level, skill, id)) then
		Log("[SKILL OBJECT] não permitido");
		CheckingSkillState = -1;
		return false;
	end;
	
	DoneSkill = false; DoneSnipeSkill = false;
	--Call(SKILL_OBJECT, myID, level, skill, id);
	PriorityCall(SKILL_OBJECT, myID, level, skill, id);
return true; end;
---------------------------------------------------------------------------
function SkillObject_Lim(myID, level, skill, id)
---------------------------------------------------------------------------
	if (myID ==  0 or id ==  0) then 
		Log("[SKILL OBJECT] não permitido: valores inválidos (nulos)");
	return false; end;
	if (myID == -1 or id == -1) then 
		Log("[SKILL OBJECT] não permitido: valores inválidos (negativos)");
	return false; end;
	
	-- if (MyState ~= LastMyState or LastMyState ~= BygoneMyState) then
		-- if  (LastMyState ~= SNIPE_ST and BygoneMyState ~= SNIPE_ST) 
		-- and (LastMyState ~= EVADE_ST and BygoneMyState ~= EVADE_ST) 
		-- then
			-- Log("[SKILL OBJECT] não permitido: mudança de estado, ignorar comandos anteriores");
			-- return false;
		-- end
	-- end;
	
	local enemyType = GetTypeFromID(id);
	if (MySkillTargetIsAlive) then 
		-- if (Merce == nil) then
			if (enemyType == 0 and LastSkillTargetType ~= 0) then
				Log("[SKILL OBJECT] não permitido: inimigo morreu e seu tipo foi reiniciado para 0");
				return false; 
			end
		-- end
	end
	LastSkillTargetType = enemyType

	if GetV(V_MOTION, id) == MOTION_DEAD and MySkillTargetIsAlive then 
		Log("[SKILL OBJECT] não permitido: inimigo morto");
		return false; 
	end
	if (IsOutOfSight(GetV(V_TARGET, id), id, false) and MySkillTargetIsAlive and id ~= MyInvisibleEnemy) then
		Log("[SKILL OBJECT] não permitido: fora do alcance");
		return false;
	end
return true; end;
---------------------------------------------------------------------------
function SkillGround_Sec(myID, level, skill, x, y)
---------------------------------------------------------------------------
	
	if (not SkillGround_Lim(myID, level, skill, x, y)) then 
		CheckingSkillState = -1;
		return false;
	end;
	
	if (x == MyX and y == MyY) then
		MyAreaSkillDestIsMyPos = true
	else
		MyAreaSkillDestIsMyPos = false
	end;
	--Call(SKILL_GROUND, myID, level, skill, x, y);
	PriorityCall(SKILL_GROUND, myID, level, skill, x, y);
return true; end;
---------------------------------------------------------------------------
function SkillGround_Lim(myID, level, skill, x, y)
---------------------------------------------------------------------------
	
	if (MyState ~= LastMyState or LastMyState ~= BygoneMyState) then
		if  (LastMyState ~= SNIPE_ST and BygoneMyState ~= SNIPE_ST) 
		and (LastMyState ~= EVADE_ST and BygoneMyState ~= EVADE_ST) 
		then
			Log("[SKILL GROUND] não permitido: mudança de estado, ignorar comandos anteriores");
			return false;
		end;
	end;
	
return true; end;
---------------------------------------------------------------------------
function DetectOwnerDirection()
---------------------------------------------------------------------------
	--Log("detectar direção do dono")
	
	--  Mestre morto ou ressuscitando: não alterou em nada a posição, então cancelar detecção.
	if (OwnerX == -1 or LastOwnerX == -1) then OwnerPosChanged = false; OwnerNearerOrFarther = 0; OwnerMovementMarkX = 0; OwnerMovementMarkY = 0; return; end
	
	--  Mudou de posição (ou não).
	if (LastOwnerX ~= OwnerX or LastOwnerY ~= OwnerY) then 
		if (IgnoreNextMovement) then
			IgnoreNextMovement = false
			
			OwnerPosChanged = false;
		else
			OwnerPosChanged = true; 
		end
	else OwnerPosChanged = false; end
	
	--  Afastando-se do homunculus.
	if     GetDistance(LastOwnerX, LastOwnerY, MyX, MyY) < GetDistance(OwnerX, OwnerY, MyX, MyY) then OwnerNearerOrFarther =  1; 
	--  Aproximando-se.
	elseif GetDistance(LastOwnerX, LastOwnerY, MyX, MyY) > GetDistance(OwnerX, OwnerY, MyX, MyY) then OwnerNearerOrFarther = -1; 
	--  Sem alteração.
	else OwnerNearerOrFarther = 0; end
	
	--  Se mudou de posição, para qual direção?
	if OwnerPosChanged then
		if     OwnerX < LastOwnerX then OwnerMovementMarkX = -1; --Log("mestre indo para esquerda.");
		elseif OwnerX > LastOwnerX then OwnerMovementMarkX = 1;  --Log("mestre indo para direita.");
		else OwnerMovementMarkX = 0; end
		if     OwnerY < LastOwnerY then OwnerMovementMarkY = -1; --Log("mestre indo para baixo.");
		elseif OwnerY > LastOwnerY then OwnerMovementMarkY = 1   --Log("mestre indo para cima.");
		else OwnerMovementMarkY = 0; end
	
	--  Mas se parou de se mover, não há direção!
	elseif OwnerMotion ~= MOTION_MOVE then OwnerMovementMarkX = 0; OwnerMovementMarkY = 0; end
end
---------------------------------------------------------------------------
function DetectPvP(myID) --  Não muito confiável: na WoE os jogadores aparecem como alvos inválidos... Usado só pra alguns comandos, sem impedir ataques por ser ou não PvP.
---------------------------------------------------------------------------
	local pvp = PvPHere; for i, v in pairs(Actors) do
		if (v > 0 and v ~= myID) and (v ~= OwnerID) and not IsOutOfSight(GetV(V_TARGET, v), v) then
			if     IsPlayer(v) and IsMonster(v) == 1 then pvp = true; break; 
			elseif IsPlayer(v) and IsMonster(v) ~= 1 then pvp = false; end
		end
	end; PvPHere = pvp;
end
---------------------------------------------------------------------------
function UpdateMotions()
---------------------------------------------------------------------------
	
	BygoneMotions               = LastMotions
	LastMotions                 = Motions
	
	Motions                     = {}
	for i, v in pairs(Actors) do Motions[v] = GetV(V_MOTION, v); 
		if (LastMotions[v] == nil) then LastMotions[v] = Motions[v]; end; 
		if (BygoneMotions[v] == nil) then BygoneMotions[v] = Motions[v]; end; 
	end
	
	if (OwnerMotion ~= LastOwnerMotion) then AnyoneCouldMove = true; end;
	if (MyMotion ~= LastMyMotion) then AnyoneCouldMove = true; end;
	if (not AnyoneCouldMove) then
		for i, v in pairs(Motions) do 
			if Motions[i] ~= LastMotions[i] then AnyoneCouldMove = true; break; end; 
		end
	end
end;
---------------------------------------------------------------------------
function ClearEnemies() 
---------------------------------------------------------------------------
	EnemiesOwnerH               = {} --  MVPs e PvP
	EnemiesOwnerM               = {} --  Monstro pode se mover.
	EnemiesOwnerL               = {} --  Monstro não se mexe.
	EnemiesDefensiveH           = {}
	EnemiesDefensiveM           = {}
	EnemiesDefensiveL           = {}
	EnemiesFriendsH             = {}
	EnemiesFriendsM             = {}
	EnemiesFriendsL             = {}
	EnemiesAggressiveH          = {}
	EnemiesAggressiveM          = {}
	EnemiesAggressiveL          = {}
	Targets                     = {}
	MyEnemy = 0; MySecondaryEnemy = 0; MyNearestEnemy = 0;
end
---------------------------------------------------------------------------
TimerToChangeTarget = 0
----------------------------- 
function UpdateEnemiesAndAllies()
---------------------------------------------------------------------------
	--  Citação para referência:
	--  EnemiesOwnerH               = {} --  MVPs e PvP
	--  EnemiesOwnerM               = {} --  Monstro pode se mover.
	--  EnemiesOwnerL               = {} --  Monstro não se mexe.
	--  EnemiesDefensiveH           = {}
	--  EnemiesDefensiveM           = {}
	--  EnemiesDefensiveL           = {}
	--  EnemiesFriendsH             = {}
	--  EnemiesFriendsM             = {}
	--  EnemiesFriendsL             = {}
	--  EnemiesAggressiveH          = {}
	--  EnemiesAggressiveM          = {}
	--  EnemiesAggressiveL          = {}
	-- ReactionTimerH              = 9000
	-- ReactionTimerM              = 6000
	-- ReactionTimerL              = 3000
	for i, v in pairs(Unreachable) do 
		if (GetTick() > v or (IsOutOfSight(GetV(V_TARGET, i), i) and BlockDistance2(OwnerID, i) <= 14)) then
			Unreachable[i] = nil;
		end;
	end;
		
	--  Remover protegidos temporários que não estiverem mais AFK.
	for k, v in pairs(TempFriends) do Friends[k] = nil; end; TempFriends = {};
	for k, v in pairs(NotTempFriends) do if (GetTick() > NotTempFriends[k]) then NotTempFriends[k] = nil; end; end
	local tCount = 0;
	for i, v in ipairs(Actors) do
		if (tCount <= 10) then if (SearchTempFriends(AIType, v)) then tCount = tCount + 1; end; end
	end
	
	for id, target in pairs(Targets) do 
		if IsOutOfSight(GetV(V_TARGET, id), id) or IsOutOfSight(GetV(V_TARGET, target), target) then
			Targets[id] = nil;
		end
	end
	-- for id, target in pairs(Targets) do	
		-- if (IsOutOfSight(GetV(V_TARGET, id), id)) then
			-- Targets[id] = nil;
		-- end
	-- end
	
	if (GetTick() > TimerToChangeTarget) then TimerToChangeTarget = 0; end
	for i, v in ipairs(Actors) do	
		-- Invisible enemies...
		if (v > 0 and v ~= MyID and v ~= OwnerID and v ~= AllyAI) then
			if (GetV(V_MOTION, v) ~= MOTION_DEAD) then
				local vX, vY = GetV(V_POSITION, v); 
				if (vX == -1 or vY == -1) then
					if (IsDefensiveEnemy(v)) then
						--Log("detectado inimigo invisível: "..v);
						EnemiesInvisible[v] = GetTick() + 9000;
					elseif (MyHPPerc >= MyAggroHPPerc and not AllyAILowHP) then
						local vType = GetTypeFromID(v);
						if 1 == IsMonster(v)  
						and Unreachable[v] == nil
						and IsOKToBeAggro(vType)
						--and BlockDistance(OwnerX, OwnerY, eX, eY) <= MaxDistance
						and not IsKS(v)
						and (MyBehavior == BEHA_ATTACK or GetBehavTo(v) == "Aggressive")
						then
							--Log("detectado inimigo invisível (como agressivo): "..v);
							EnemiesInvisible[v] = GetTick() + 9000;
						end
					end
				end
			end
		end
		
		if (IsKS(v)) then 	
		    EnemiesOwnerH[v]               = nil; --  MVPs e PvP
			EnemiesOwnerM[v]               = nil; --  Monstro pode se mover.
			EnemiesOwnerL[v]               = nil; --  Monstro não se mexe.
			EnemiesDefensiveH[v]           = nil;
			EnemiesDefensiveM[v]           = nil;
			EnemiesDefensiveL[v]           = nil;
			EnemiesFriendsH[v]             = nil;
			EnemiesFriendsM[v]             = nil;
			EnemiesFriendsL[v]             = nil;
			EnemiesAggressiveH[v]          = nil;
			EnemiesAggressiveM[v]          = nil;
			EnemiesAggressiveL[v]          = nil;
			--Targets[v]                     = nil;
		end
		
		if (v > 0 and v ~= MyID and v ~= OwnerID and v ~= AllyAI and not IsOutOfSight(GetV(V_TARGET, v), v)) then
			
			local enemyType = GetTypeFromID(v);
			local isOffensiveToOwner, hasOffensiveMotionToOwner = IsOffensive(OwnerID, v);
			local isOffensiveToMe,    hasOffensiveMotionToMe    = IsOffensive(MyID   , v);
			
			if     isOffensiveToOwner then 
				Targets[v] = OwnerID
				if (IsPlayer(v) or MVP_KS_OK[enemyType]) and hasOffensiveMotionToOwner then
					--  Alta prioridade.
					--Log("inimigo de alta prioridade (do mestre): "..v.."("..enemyType..")");
					EnemiesOwnerH[v] = GetTick() + ReactionTimerH;
					EnemiesOwnerM[v] = nil;
					EnemiesOwnerL[v] = nil;
				elseif (EnemiesOwnerH[v] == nil and (Motions[v] ~= LastMotions[v] or LastMotions[v] ~= BygoneMotions[v])) and hasOffensiveMotionToOwner then
					--  Média prioridade.
					--Log("inimigo de média prioridade (do mestre): "..v.."("..enemyType..")");
					EnemiesOwnerM[v] = GetTick() + ReactionTimerM;
					EnemiesOwnerL[v] = nil;
				elseif (EnemiesOwnerH[v] == nil and EnemiesOwnerM[v] == nil) then
					--  Baixa prioridade.
					--Log("inimigo de baixa prioridade (do mestre): "..v.."("..enemyType..")");
					EnemiesOwnerL[v] = GetTick() + ReactionTimerL;
				end;
				
			elseif isOffensiveToMe then 
				Targets[v] = MyID
				if (IsPlayer(v) or MVP_KS_OK[enemyType]) and hasOffensiveMotionToMe then
					--  Alta prioridade.
					--Log("inimigo de alta prioridade (meu): "..v.."("..enemyType..")");
					EnemiesDefensiveH[v] = GetTick() + ReactionTimerH;
					EnemiesDefensiveM[v] = nil;
					EnemiesDefensiveL[v] = nil;
				elseif (EnemiesDefensiveH[v] == nil and (Motions[v] ~= LastMotions[v] or LastMotions[v] ~= BygoneMotions[v])) and hasOffensiveMotionToMe then
					--  Média prioridade.
					--Log("inimigo de média prioridade (meu): "..v.."("..enemyType..")");
					EnemiesDefensiveM[v] = GetTick() + ReactionTimerM;
					EnemiesDefensiveL[v] = nil;
				elseif (EnemiesDefensiveH[v] == nil and EnemiesDefensiveM[v] == nil) then
					--  Baixa prioridade.
					--Log("inimigo de baixa prioridade (meu): "..v.."("..enemyType..")");
					EnemiesDefensiveL[v] = GetTick() + ReactionTimerL;
				end;
				
			else
				
				--  TODO: friends...
				--  EnemiesFriendsH             = {}
				--  EnemiesFriendsM             = {}
				--  EnemiesFriendsL             = {}
				for friend, w in pairs(Friends) do
					local isOffensiveToFriend, hasOffensiveMotionToFriend = IsOffensive(friend, v);
					if isOffensiveToFriend then 
						Targets[v] = friend
						if (IsPlayer(v) or MVP_KS_OK[enemyType]) and hasOffensiveMotionToFriend then
							--  Alta prioridade.
							--Log("inimigo de alta prioridade (de aliado): "..v.."("..enemyType..")");
							EnemiesFriendsH[v] = GetTick() + ReactionTimerH;
							EnemiesFriendsM[v] = nil;
							EnemiesFriendsL[v] = nil;
						elseif (EnemiesFriendsH[v] == nil and (Motions[v] ~= LastMotions[v] or LastMotions[v] ~= BygoneMotions[v])) and hasOffensiveMotionToFriend then
							--  Média prioridade.
							--Log("inimigo de média prioridade (de aliado): "..v.."("..enemyType..")");
							EnemiesFriendsM[v] = GetTick() + ReactionTimerM;
							EnemiesFriendsL[v] = nil;
						elseif (EnemiesFriendsH[v] == nil and EnemiesFriendsM[v] == nil) then
							--  Baixa prioridade.
							--Log("inimigo de baixa prioridade (de aliado): "..v.."("..enemyType..")");
							EnemiesFriendsL[v] = GetTick() + ReactionTimerL;
						end;
					end
				end
				
				-- if  (MyHPPerc >= MyAggroHPPerc and not AllyAILowHP
				-- and (MySPPerc >= 60)
				-- ) then
					
					local eX, eY = GetV(V_POSITION, v); 
					if 1 == IsMonster(v)  
					and Unreachable[v] == nil
					and IsOKToBeAggro(enemyType)
					and BlockDistance(OwnerX, OwnerY, eX, eY) <= MaxDistance
					and not IsKS(v)
					and (MyBehavior == BEHA_ATTACK or GetBehavTo(v) == "Aggressive")
					then
						if (IsPlayer(v) or MVP_KS_OK[enemyType]) then
							--  Alta prioridade.
							--Log("inimigo de alta prioridade (meu, sendo agressivo): "..v.."("..enemyType..")");
							EnemiesAggressiveH[v] = GetTick() + ReactionTimerH;
							EnemiesAggressiveM[v] = nil;
							EnemiesAggressiveL[v] = nil;
						elseif (EnemiesAggressiveH[v] == nil and (Motions[v] ~= LastMotions[v] or LastMotions[v] ~= BygoneMotions[v])) then
							--  Média prioridade.
							--Log("inimigo de média prioridade (meu, sendo agressivo): "..v.."("..enemyType..")");
							EnemiesAggressiveM[v] = GetTick() + ReactionTimerM;
							EnemiesAggressiveL[v] = nil;
						elseif (EnemiesAggressiveH[v] == nil and EnemiesAggressiveM[v] == nil) then
							--  Baixa prioridade.
							--Log("inimigo de baixa prioridade (meu, sendo agressivo): "..v.."("..enemyType..")");
							EnemiesAggressiveL[v] = GetTick() + ReactionTimerL;
						end;
					end;
				-- end;
			end;
		end;
	end;
	pcall(SaveTypes, AIType); LoadTypes(AIType); 
	
	local ownerEHCount = List.count(EnemiesOwnerH);
	local ownerEMCount = List.count(EnemiesOwnerM);
	local ownerELCount = List.count(EnemiesOwnerL);
	local ownerECount = ownerEHCount + ownerEMCount + ownerELCount; 
	
	local myEHCount = List.count(EnemiesDefensiveH);
	local myEMCount = List.count(EnemiesDefensiveM);
	local myELCount = List.count(EnemiesDefensiveL);
	local myECount = myEHCount + myEMCount + myELCount
	
	local oldEnemy = MyEnemy
	if (CanDoKS ~= 0 and IsOutOfSight(GetV(V_TARGET, CanDoKS), CanDoKS)) then
		Log("inimigo adquirido por comando fora do alcance: "..CanDoKS);
		CanDoKS = 0
	else
	end
	if (CanDoKS ~= MyEnemy) then
		if (TimerToChangeTarget == 0 or IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy) or Unreachable[MyEnemy] ~= nil) then
			oldEnemy = 0
			
			CanDoKS = 0; 
			MyEnemy = 0; 
		elseif (IsAggroEnemy(MyEnemy) and MyState == CHASE_ST) then
			CanDoKS = 0; 
			MyEnemy = 0;
		end;
	end;
	MySecondaryEnemy = MyEnemy; MyNearestEnemy = MyEnemy; MyNearestEnemyDis = (MaxDistance + 1) * 2;
	--  TODO: ordenar checagem de inimigos por condições
	--  TODO: manter inimigo em alguns casos
	--  Count > ou <
	if (ownerECount - 3 > myECount
		or OwnerMotion == MOTION_SIT
		or OwnerMotion == MOTION_MOVE
		or OwnerHPPerc + 5 < MyHPPerc
		) then
		CheckOwnerEnemies();
		
		CheckDefensivelyEnemies();
	else
		CheckDefensivelyEnemies();
		
		CheckOwnerEnemies();
	end;
	CheckFriendsEnemies();
	
	CheckInvisibleEnemies();
	if  (MyHPPerc >= MyAggroHPPerc and not AllyAILowHP
	and (MySPPerc >= 60 or (MySPPerc >= 30 and MyHPPerc >= MyEvadeHPPerc))
	) then
		local useOld = false;
		if (MyEnemy == 0) then
			if (oldEnemy > 0) then
				if (Motions[oldEnemy] == MOTION_MOVE 
				and GetDistance2(MyID, oldEnemy) > MyAttackRange and MyState == CHASE_ST) then
					
				else
					useOld = true;
				end
			end
		end
		CheckAggressivelyEnemies();
		if (useOld) then
			local myEnemyType = GetTypeFromID(MyEnemy); local oldEnemyType = GetTypeFromID(oldEnemy);
			if (myEnemyType <= oldEnemyType) then	
				MyEnemy = oldEnemy
			end
		end
	end
	
	--Log("MyEnemy: "..MyEnemy.."; MyNearestEnemy: "..MyNearestEnemy)
	if (MyEnemy ~= LastMyEnemy) then
		RestartState(CHASE_ST , true);
		RestartState(ATTACK_ST, true);
		TimerToChangeTarget = GetTick() + 10000
	end;
end;
--------------------------------------------------------------------------- 
CheckInvisibleNow = true
-----------------------------
function CheckInvisibleEnemies() 
--------------------------------------------------------------------------- 
	MyInvisibleEnemy = 0
	if (CheckInvisibleNow) then
		CheckInvisibleNow = false
		local count = 0;
		for id, timer in pairs(EnemiesInvisible) do 
			if (GetTick() > timer) then
				EnemiesInvisible[id] = nil;
			else
				MyInvisibleEnemy = id
				count = count + 1
				if (count > MyInvisibleEnemyI) then
					break;
				end
			end
		end
		if (MyInvisibleEnemyI >= count) then
			MyInvisibleEnemyI = 0
		else 
			MyInvisibleEnemyI = count
		end
	else
		CheckInvisibleNow = true
	end
end
--------------------------------------------------------------------------- 
function CheckOwnerEnemies()
---------------------------------------------------------------------------
	local disMin = (MaxDistance + 1) * 2; local dis; local enemyTypeMax = 0; local enemyType; 
	local myEnemy = MyEnemy;
	for i, v in pairs(EnemiesOwnerH) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]       = nil;
			EnemiesOwnerH[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end;
				else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end;
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesOwnerM) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]       = nil;
			EnemiesOwnerM[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end;   
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesOwnerL) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]       = nil;
			EnemiesOwnerL[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end
	end;
end;
--------------------------------------------------------------------------- 
function CheckDefensivelyEnemies()
---------------------------------------------------------------------------
	local disMin = (MaxDistance + 1) * 2; local dis; local enemyTypeMax = 0; local enemyType; 
	local myEnemy = MyEnemy;
	for i, v in pairs(EnemiesDefensiveH) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]           = nil;
			EnemiesDefensiveH[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end;
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesDefensiveM) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]           = nil;
			EnemiesDefensiveM[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end;
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesDefensiveL) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]           = nil;
			EnemiesDefensiveL[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end 
	end;
end
--------------------------------------------------------------------------- 
function CheckAggressivelyEnemies()
---------------------------------------------------------------------------
	local disMin = (MaxDistance + 1) * 2; local dis; local enemyTypeMax = 0; local enemyType; 
	local myEnemy = MyEnemy;
	local mySecondaryEnemy = MySecondaryEnemy;
	for i, v in pairs(EnemiesAggressiveH) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i) or IsKS(i)) then
			--Targets[i]            = nil;
			EnemiesAggressiveH[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (mySecondaryEnemy == 0) then 
						if (MySecondaryEnemy == 0) then 
							MySecondaryEnemy = i; 
						elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
							MySecondaryEnemy = i; 
						end; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
		end
	end;
	myEnemy = MyEnemy;
	mySecondaryEnemy = MySecondaryEnemy;
	for i, v in pairs(EnemiesAggressiveM) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i) or IsKS(i)) then
			--Targets[i]            = nil;
			EnemiesAggressiveM[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (mySecondaryEnemy == 0) then 
						if (MySecondaryEnemy == 0) then 
							MySecondaryEnemy = i; 
						elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
							MySecondaryEnemy = i; 
						end; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
		end;
	end;
	myEnemy = MyEnemy;
	mySecondaryEnemy = MySecondaryEnemy;
	for i, v in pairs(EnemiesAggressiveL) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i) or IsKS(i)) then
			--Targets[i]            = nil;
			EnemiesAggressiveL[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (mySecondaryEnemy == 0) then 
						if (MySecondaryEnemy == 0) then 
							MySecondaryEnemy = i; 
						elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
							MySecondaryEnemy = i; 
						end; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
		end;
	end;
end
---------------------------------------------------------------------------
function CheckFriendsEnemies()
---------------------------------------------------------------------------
	local disMin = (MaxDistance + 1) * 2; local dis; local enemyTypeMax = 0; local enemyType; 
	local myEnemy = MyEnemy;
	for i, v in pairs(EnemiesFriendsH) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]         = nil;
			EnemiesFriendsH[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end;
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesFriendsM) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]         = nil;
			EnemiesFriendsM[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end;
	end;
	myEnemy = MyEnemy;
	for i, v in pairs(EnemiesFriendsL) do
		if (GetTick() > v or IsOutOfSight(GetV(V_TARGET, i), i)) then
			Targets[i]         = nil;
			EnemiesFriendsL[i] = nil;
		else
			enemyType = GetTypeFromID(i);
			dis = GetDistance2(MyID, i)
			if (dis < disMin) or MyEnemy == 0 then if (myEnemy == 0) then MyEnemy = i; end; disMin = dis; 
			else--if (dis == disMin) then
				if (enemyType > enemyTypeMax) then enemyTypeMax = enemyType; if (myEnemy == 0) then MyEnemy = i; end; else 
					if (MySecondaryEnemy == 0) then 
						MySecondaryEnemy = i; 
					elseif (GetDistance2(i, MyID) < GetDistance2(MySecondaryEnemy, MyID)) then 
						MySecondaryEnemy = i; 
					end; 
				end
			--else MySecondaryEnemy = i; 
			end 
			if (dis < MyNearestEnemyDis) then
				MyNearestEnemy = i;
				MyNearestEnemyDis = dis
			end
		end 
	end;
end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE COMANDOS
-- ========================================================================
---------------------------------------------------------------------------
function ProcessCommand(msg)
---------------------------------------------------------------------------
	if     (msg[1] == MOVE_CMD) then
		Log("[MOVE_CMD]");          OnMOVE_CMD(msg[2], msg[3])
	elseif (msg[1] == STOP_CMD) then
		Log("[STOP_CMD]");          OnSTOP_CMD()
	elseif (msg[1] == ATTACK_OBJECT_CMD) then
		Log("[ATTACK_OBJECT_CMD]"); OnATTACK_OBJECT_CMD(msg[2])
	elseif (msg[1] == ATTACK_AREA_CMD) then
		Log("[ATTACK_AREA_CMD]");   OnATTACK_AREA_CMD(msg[2], msg[3])
	elseif (msg[1] == PATROL_CMD) then
		Log("[PATROL_CMD]");        OnPATROL_CMD(msg[2], msg[3])
	elseif (msg[1] == HOLD_CMD) then
		Log("[HOLD_CMD]");          OnHOLD_CMD()
	elseif (msg[1] == SKILL_OBJECT_CMD) then
		Log("[SKILL_OBJECT_CMD]");  OnSKILL_OBJECT_CMD(msg[2], msg[3], msg[4], msg[5])
	elseif (msg[1] == SKILL_AREA_CMD) then
		Log("[SKILL_AREA_CMD]");    OnSKILL_AREA_CMD(msg[2], msg[3], msg[4], msg[5])
	elseif (msg[1] == FOLLOW_CMD) then
		Log("[FOLLOW_CMD]");        OnFOLLOW_CMD()
	else
		Log("[UNKNOWN]: "..msg[1]..".");
	end
end
---------------------------------------------------------------------------
function OnMOVE_CMD(x, y)
---------------------------------------------------------------------------
	Log("[OnMOVE_CMD] para "..x.."; "..y);
	
	--TimerToSnipe = GetTick() + 60000
	
	if (x == MyX and y == MyY) then
		local noSnipesFile = AddIDToPath(FILES[AIType].NO_SNIPES, OwnerID)
		local noEvadesFile = AddIDToPath(FILES[AIType].NO_EVADES, OwnerID)
		if     AutoSnipes == 1 then AutoSnipes = 2; Log("modo: sem fugir dos inimigos ao ter pouco HP."); 
			if     FileExists(noSnipesFile) then os.remove(noSnipesFile); end
			if not FileExists(noEvadesFile) then WriteFile(noEvadesFile, "true", "w"); end;
			MyDestX, MyDestY = MyX + 1, MyY; Move(MyID, MyDestX, MyDestY)
			
		elseif AutoSnipes == 2 then AutoSnipes = 0; Log("modo: sem ir para longe para usar habilidades."); 
			if not FileExists(noEvadesFile) then WriteFile(noEvadesFile, "true", "w"); end;
			if not FileExists(noSnipesFile) then WriteFile(noSnipesFile, "true", "w"); end; 
			MyDestX, MyDestY = MyX - 1, MyY; Move(MyID, MyDestX, MyDestY)
			
		else                        AutoSnipes = 1;  Log("modo: usar habilidades à distância.");
			if     FileExists(noSnipesFile) then os.remove(noSnipesFile); end
			if     FileExists(noEvadesFile) then os.remove(noEvadesFile); end
			MyDestX, MyDestY = MyX, MyY - 1; Move(MyID, MyDestX, MyDestY)
			
		end 
		return
	end
	
	if x == OwnerX and y == OwnerY then
		if (OwnerMotion == MOTION_SIT) then
			local travelFile = AddIDToPath(FILES[AIType].TRAVEL, OwnerID)
			if not UseTravel then UseTravel = true;
				Log("modo: usar movimentação por Troca de Lugar.")
				if not FileExists(travelFile) then WriteFile(travelFile, "true", "w"); end; 
				MyDestX, MyDestY = OwnerX - 1, OwnerY; Move(MyID, MyDestX, MyDestY)
			else                  UseTravel = false;
				Log("modo: não viajar com Troca de Lugar.")
				if     FileExists(travelFile) then os.remove(travelFile); end
				MyDestX, MyDestY = OwnerX + 1, OwnerY; Move(MyID, MyDestX, MyDestY)
			end
		else
			local noChasesFile = AddIDToPath(FILES[AIType].NO_CHASES, OwnerID)
			if not LongRangeShooter then LongRangeShooter = true;
				Log("modo: ataque à distância.")
				if not FileExists(noChasesFile) then WriteFile(noChasesFile, "true", "w"); end; 
			else                         LongRangeShooter = false;
				Log("modo: mover-se ao alvo.")
				if     FileExists(noChasesFile) then os.remove(noChasesFile); end
			end
		end
		return
	end
	local dontSaveBehav = false;
	if (LongRangeShooter) then
		LongRangeShooter = false; dontSaveBehav = true;
		Log("modo: mover-se ao alvo.")
		local noChasesFile = AddIDToPath(FILES[AIType].NO_CHASES, OwnerID)
		if FileExists(noChasesFile) then os.remove(noChasesFile); end
	end
	local eX, eY = -1, -1
	for i, v in ipairs(Actors) do
		
		if     (1 == IsMonster(v) and PvPHere) then
			
			eX, eY = GetV(V_POSITION, v);
			if (eX == x) and (eY == y) then
				
				MyEnemy = v; CanDoKS = MyEnemy; SaveBehav(AIType, MyEnemy, "Aggressive")
				MyState = CHASE_ST
				return
			end
			
		elseif (0 == IsMonster(v) and not PvPHere) 
				or IsPlayer(v) then
				
			eX, eY = GetV(V_POSITION, v);
			if (eX == x) and (eY == y) then 
				
				Log("checagem de amigos ao mover")
				if SaveFriends(AIType, v) == 1 then --  Se adicionar amigo (1), não se mova. Se remover (2), realizar comando de mover normalmente.
					return; 
				end
			end
			
		elseif (1 == IsMonster(v)) 
				or not IsPlayer(v) then
				
			eX, eY = GetV(V_POSITION, v);
			if (eX == x) and (eY == y) then
				
				MyEnemy = v; CanDoKS = MyEnemy; SaveBehav(AIType, MyEnemy, "Aggressive")
				MyState = CHASE_ST
				return
			end
		end
	end
	
	if (dontSaveBehav == false) then
		if MyEnemy > 0 then SaveBehav(AIType, MyEnemy, "Defensive"); end; MyEnemy = 0; CanDoKS = 0;
	end
	ClearEnemies()
	x, y = RepairDest(MyID, x, y)
	--  TODO: mudar MyState
	if (x == MyDestX and y == MyDestY) and MyMotion == MOTION_MOVE and MyState == MOVE_CMD_ST then
		return
	end;
	MyDestX, MyDestY = x, y; Move(MyID, MyDestX, MyDestY)
	MyState = MOVE_CMD_ST;
	StateTimeOut[MyState] = GetTick() + 5000;
end;
---------------------------------------------------------------------------
function OnMOVE_CMD_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 5000; end
	
	if (MyX == MyDestX and MyY == MyDestY) or (GetTick() >= StateTimeOut[MyState]) then 
		--  TODO: se owner se mexe, follow
		if (NeedToFollow) then
			if (MyState == MOVE_CMD_ST) then OnFOLLOW_ST(); end;
			MyState = FOLLOW_ST;
		else
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true)
			if (MyState == MOVE_CMD_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end
		return
	end	
	
	--MyDestX, MyDestY = RepairDest(MyID, MyDestX, MyDestY); 
	Move(MyID, RepairDest(MyID, MyDestX, MyDestY))
end
---------------------------------------------------------------------------
function OnSTOP_CMD() --  Função padrão, mas não usada pelo jogo.
---------------------------------------------------------------------------
	Log("[OnSTOP_CMD]");
end;
---------------------------------------------------------------------------
function OnATTACK_OBJECT_CMD(id)
---------------------------------------------------------------------------
	local enemyType = GetTypeFromID(id); local x, y = GetV(V_POSITION, id);
	Log("[OnATTACK_OBJECT_CMD] "..id..", "..enemyType..", x: "..x..", y: "..y)
	MyEnemy = id; CanDoKS = MyEnemy; SaveBehav(AIType, MyEnemy, "Aggressive")
	-----------
	MyState = CHASE_ST
end
---------------------------------------------------------------------------
function OnATTACK_AREA_CMD(x, y) --  Função padrão, mas não usada pelo jogo.
---------------------------------------------------------------------------
	
end
---------------------------------------------------------------------------
function OnPATROL_CMD(x, y)
---------------------------------------------------------------------------
	
end
---------------------------------------------------------------------------
function OnHOLD_CMD()
---------------------------------------------------------------------------
	
end
---------------------------------------------------------------------------
function OnSKILL_OBJECT_CMD(level, skill, id)
---------------------------------------------------------------------------
	Log("[OnSKILL_OBJECT_CMD] nível: "..level..", habilidade: "..skill..", alvo: "..id..".")
	MySkill       = skill; 
	MySkillLevel  = level
	MySkillTarget = id
	CheckingSkillState = -1
	
	local needApproach = false; local mySkillRange, alternateRange = SkillRange(MyID, skill, level)
	if (GetDistance2(MyID, MySkillTarget) > mySkillRange and GetDistance2(MyID, MySkillTarget) > alternateRange) then needApproach = true; end
	
	if (not needApproach or LongRangeShooter) and TimerToResComChange == 0 then
		UseSkill(MyID, level, skill, id, true) 
		return
	end
	Log("[SKILL_OBJECT_CMD] skill ("..skill.."): alcance: "..mySkillRange..", requer aproximação.")
	if (MyState ~= SKILL_OBJECT_CMD_ST) then MyStateBeforeCommand = MyState; end;
	ScheduledSkill = false;
	DoneSkill      = false;
	MyState = SKILL_OBJECT_CMD_ST; StateTimeOut[MyState] = GetTick() + 5000
end
---------------------------------------------------------------------------
ScheduledSkill = false;
DoneSkill      = false;
-----------------------------
function OnSKILL_OBJECT_CMD_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 5000; end
	
	if TimerToResComChange ~= 0 then
		if GetTick() > TimerToResComChange or TestClicks > 2 then
			TimerToResComChange = 0; TestClicks = 0; Log("[OnSKILL_OBJECT_CMD_ST] comando especial (\"reservado\": modificado) deve ser executado agora.");
		else
			return
		end;
	end;
	
	if MySkill == 0 then 
		ScheduledSkill = false;
		DoneSkill      = false;
		if (MyStateBeforeCommand == FOLLOW_CMD_ST) then
			Log("voltar a ficar passivo")
			MyState = FOLLOW_CMD_ST
		elseif MyEnemy > 0 then 
			if (MyState == SKILL_OBJECT_CMD_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			if (MyState == SKILL_OBJECT_CMD_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return; 
	end;
	
	if (ScheduledSkill) then
		if (DoneSkill) or (GetTick() >= StateTimeOut[MyState]) then		
			ScheduledSkill = false;
			DoneSkill      = false;
			if (MyStateBeforeCommand == FOLLOW_CMD_ST) then
				Log("voltar a ficar passivo")
				MyState = FOLLOW_CMD_ST
			elseif MyEnemy > 0 then 
				if (MyState == SKILL_OBJECT_CMD_ST) then OnCHASE_ST(); end;
				MyState = CHASE_ST;
			else 
				if (MyState == SKILL_OBJECT_CMD_ST) then OnIDLE_ST(); end;
				MyState = IDLE_ST;
			end; 
		end
		return;
	end
	
	local range = SkillRange(MyID, MySkill, MySkillLevel)
	if GetDistance2(MyID, MySkillTarget) <= range or (GetTick() >= StateTimeOut[MyState]) then
		
		StateTimeOut[MyState] = GetTick() + 5000;
		Log("[SKILL_OBJECT_CMD_ST] dentro do alcance: usar habilidade ("..MySkill..")."); 
		
		ScheduledSkill = true;
		UseSkill(MyID, MySkillLevel, MySkill, MySkillTarget, true); 
		return; 
	end
	
	local x, y = BestMovementTo(MySkillTarget, MySkill, MySkillLevel)
	MyDestX, MyDestY = RepairDest(MyID, x, y); Move(MyID, MyDestX, MyDestY)
end
---------------------------------------------------------------------------
ScheduledAreaSkill = false;
DoneAreaSkill      = false;
-----------------------------
function OnSKILL_AREA_CMD(level, skill, x, y)
---------------------------------------------------------------------------
	Log("[OnSKILL_AREA_CMD] nível: "..level..", habilidade: "..skill..", alvo: "..x..", "..y..".")
	MyAreaSkill		            = skill
	MyAreaSkillLevel            = level
	MyAreaSkillDestX	            = x
	MyAreaSkillDestY	            = y
	CheckingSkillState = -1
	
	local needApproach = false; local mySkillRange, alternateRange = SkillRange(MyID, skill, level)
	if (GetDistance(MyX, MyY, x, y) > mySkillRange and GetDistance(MyX, MyY, x, y) > alternateRange) then needApproach = true; end
	
	if (not needApproach or LongRangeShooter) and TimerToResComChange == 0 then
		UseAreaSkill(MyID, level, skill, x, y, true) 
		return
	end
	Log("[OnSKILL_AREA_CMD] skill ("..skill.."): alcance: "..mySkillRange..", requer aproximação.")
	-- Log(MyState)
	-- Log(MyStateBeforeCommand)
	if (MyState ~= SKILL_AREA_CMD_ST) then MyStateBeforeCommand = MyState; end;
	ScheduledAreaSkill = false;
	DoneAreaSkill      = false;
	MyState = SKILL_AREA_CMD_ST; StateTimeOut[MyState] = GetTick() + 5000
end
---------------------------------------------------------------------------
function OnSKILL_AREA_CMD_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 5000; end
	
	if TimerToResComChange ~= 0 then
		if GetTick() > TimerToResComChange or TestClicks > 2 then
			TimerToResComChange = 0; TestClicks = 0; Log("[OnSKILL_AREA_CMD_ST] comando especial (\"reservado\": modificado) deve ser executado agora.");
		else
			return
		end;
	end;
	
	-- Log(MyStateBeforeCommand)
	if MyAreaSkill == 0 then 	
		ScheduledAreaSkill = false;
		DoneAreaSkill      = false;
		if (MyStateBeforeCommand == FOLLOW_CMD_ST) then
			Log("voltar a ficar passivo")
			MyState = FOLLOW_CMD_ST
		elseif MyEnemy > 0 then 
			if (MyState == SKILL_AREA_CMD_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			if (MyState == SKILL_AREA_CMD_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return; 
	end;
	
	if (ScheduledAreaSkill) then
		if (DoneAreaSkill) or (GetTick() >= StateTimeOut[MyState]) then		
			ScheduledAreaSkill = false;
			DoneAreaSkill      = false;
			if (MyStateBeforeCommand == FOLLOW_CMD_ST) then
				Log("voltar a ficar passivo")
				MyState = FOLLOW_CMD_ST
			elseif MyEnemy > 0 then 
				if (MyState == SKILL_AREA_CMD_ST) then OnCHASE_ST(); end;
				MyState = CHASE_ST;
			else 
				if (MyState == SKILL_AREA_CMD_ST) then OnIDLE_ST(); end;
				MyState = IDLE_ST;
			end; 
			return; 
		end
		return;
	end
	
	local range = SkillRange(MyID, MyAreaSkill, MyAreaSkillLevel)
	if GetDistance(MyX, MyY, MyAreaSkillDestX, MyAreaSkillDestY) <= range or (GetTick() >= StateTimeOut[MyState]) then
		
		StateTimeOut[MyState] = GetTick() + 5000;
		Log("[SKILL_AREA_CMD_ST] dentro do alcance: usar habilidade ("..MyAreaSkill..")."); 
		
		ScheduledAreaSkill = true;
		UseAreaSkill(MyID, MyAreaSkillLevel, MyAreaSkill, MyAreaSkillDestX, MyAreaSkillDestY, true); 
		return; 
	end
	
	local x, y = MyAreaSkillDestX, MyAreaSkillDestY
	MyDestX, MyDestY = RepairDest(MyID, x, y); Move(MyID, MyDestX, MyDestY)
end
---------------------------------------------------------------------------
function OnFOLLOW_CMD()
---------------------------------------------------------------------------
	Log("[OnFOLLOW_CMD] \"Aguardar\"");
	--  Alterar configurações com este comando.
	if MyBehavior == BEHA_DEFEND then MyBehavior = BEHA_ATTACK; 
		if not FileExists(AddIDToPath(FILES[AIType].AGGRO_TO_ALL, OwnerID)) then WriteFile(AddIDToPath(FILES[AIType].AGGRO_TO_ALL, OwnerID), "true", "w"); end
		Log("comportamento: AGRESSIVO.")
	else                              MyBehavior = BEHA_DEFEND; 
		if     FileExists(AddIDToPath(FILES[AIType].AGGRO_TO_ALL, OwnerID)) then os.remove(AddIDToPath(FILES[AIType].AGGRO_TO_ALL, OwnerID));              end
		Log("comportamento: DEFENSIVO.")
	end
	ClearEnemies()
	DelayToRefreshBehav = GetTick() + 1000
	if (MyState ~= FOLLOW_CMD_ST) then
		Log("[OnFOLLOW_CMD] aguardar: super passivo"); 
		MyState = FOLLOW_CMD_ST; 
		local d = GetDistance(OwnerX, OwnerY, MyX, MyY)
		if (d > 3) then 
			MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY)
		end
		return;
	else
		local noSkillsFile = AddIDToPath(FILES[AIType].NO_SKILLS, OwnerID)
		local useBuffsFile = AddIDToPath(FILES[AIType].USE_BUFFS, OwnerID)
		if     AutoSkills == 1 then AutoSkills = 2; Log("modo: usar habilidades com buffs de homunculi iniciais."); 
			if     FileExists(noSkillsFile) then os.remove(noSkillsFile); end
			if not FileExists(useBuffsFile) then WriteFile(useBuffsFile, "true", "w"); end; 
			MyDestX, MyDestY = OwnerX + 1, OwnerY; Move(MyID, MyDestX, MyDestY)
			TimerToUseSkill = GetTick() + 4000
		elseif AutoSkills == 2 then AutoSkills = 0; Log("modo: não usar habilidades."); 
			if     FileExists(useBuffsFile) then os.remove(useBuffsFile); end
			if not FileExists(noSkillsFile) then WriteFile(noSkillsFile, "true", "w"); end; 
			MyDestX, MyDestY = OwnerX - 1, OwnerY; Move(MyID, MyDestX, MyDestY)
			TimerToUseSkill = GetTick() + 4000
		else                        AutoSkills = 1; Log("modo: usar habilidades.");
			if     FileExists(useBuffsFile) then os.remove(useBuffsFile); end
			if     FileExists(noSkillsFile) then os.remove(noSkillsFile); end
			MyDestX, MyDestY = OwnerX, OwnerY - 1; Move(MyID, MyDestX, MyDestY)
			TimerToUseSkill = GetTick() + 4000
		end 
		
		Log("[OnFOLLOW_CMD] reativo"); 
		MyState = IDLE_ST; 
		return;
	end;
end
---------------------------------------------------------------------------
function OnFOLLOW_CMD_ST()
---------------------------------------------------------------------------
	local d = GetDistance(OwnerX, OwnerY, MyX, MyY)
	if (d <= 3) then return; 
	else MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY); end	
end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE ESTADOS
-- ========================================================================
---------------------------------------------------------------------------
--  Tempo para começar a tomar ações (depois de ser criado ou mudar de mapa ou teletransporte)
TimerToUseSkill = 0 --  Habilidades
TimerToReact    = 0 --  Realizar qualquer tipo de ação
-----------------------------
TimerIdleMove   = 0
TimerToGetClose = 0
-- TimerToTestAngriffs = 0
-- RemovingAngriffs = false;
-----------------------------
TimerCastleTravel   = 0
TravelCastle        = false
-----------------------------
function OnIDLE_ST() 
---------------------------------------------------------------------------
	--  ["Eu não sei pra quê serve isto e vou deixar aqui..."]
	--  Já descobri, são para os "comandos reservados" da AI. Dá pra fazer mais comandos do homunculus com isto...
	local cmd = List.popleft(ResCmdList)
	if (cmd ~= nil) then ProcessCommand(cmd); return; end
	-- if (TimerToUseSkill == 0) then
		-- TimerToUseSkill = GetTick() + 4000
	-- end
	--  TODO: get enemies...
	Log("[OnIDLE_ST]");
	local distance = GetDistance2(OwnerID, MyID)
	if LongRangeShooter then
		if (distance > 1) then
			if NeedToGetClose then
				MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY); 
			end
		end
	elseif (NeedToFollow) then 
		if (MyState == IDLE_ST) then
			OnFOLLOW_ST();
		end
		MyState = FOLLOW_ST;
		return;
	end
	
	if (TimerToReact ~= 0 and (GetTick() > TimerToReact)) then
		TimerToReact = 0
	end
	if (TimerToReact ~= 0) then return; end;
	
	if (MyEnemy > 0 and MyState == IDLE_ST) then
		if (IsInAttackSight(MyID, MyEnemy)) then
			OnATTACK_ST();
			MyState = ATTACK_ST;
			return;
		else
			OnCHASE_ST(); 
			MyState = CHASE_ST;
			return;
		end;
	end;
	
	--  Se levou dano e é um Bayeri, tentar utilizar Raiva Iluminada para cancelar.
	-- if (GetTick() > TimerToTestAngriffs) then
		-- if (MyHP < LastMyHP) then
			-- if (Homun == BAYERI) then
				-- if (IsAvailable(8035)) then
					-- local i = GetSlotOfSkill(8035);
					-- if (Skills[Available[i].Skill] ~= nil) then 
						-- if (Skills[Available[i].Skill].Reuse > 0 and GetTick() < Skills[Available[i].Skill].Reuse - 5000) then
							
							-- RemovingAngriffs = true
							
							-- local success, failed = 
								-- pcall(GetBestCombo, 8035, Available[i].Level, MyID, MyX, MyY); 
							-- if not success and failed ~= nil then pcall(Log, failed); end 
						-- end
					-- end
				-- end
			-- end
		-- end
	-- end
	
	if (OwnerAFK and UseTravel) then
		if (TimerCastleTravel == 0) then
			TimerCastleTravel = GetTick() + 30000
		elseif (GetTick() > TimerCastleTravel) then
			MoveToRandom(MyID)
			TravelCastle = true;
			TimerCastleTravel = 0;
			
			IgnoreNextMovement = true
			
			IgnoreCastlingReDo = true
		end
	else
		TravelCastle = false;
		TimerCastleTravel = 0;
	end
	--if (GetTick() > TimerToUseSkill) then
		UseAutoSkills()
	--end
	
	if (TravelCastle) then
		if (List.containsV2(CCommands, SKILL_OBJECT)) then
			local command = SKILL_OBJECT
			local myID	= CCommandsData[command][1];
			local level	= CCommandsData[command][2];
			local skill	= CCommandsData[command][3];
			local id	= CCommandsData[command][4];
			if (skill == 8005) then
				TravelCastle = false;
			end
		end
	end
	
	if (MyX == MyDestX and MyY == MyDestY) then
		RandomToGetClose = false
	end
	--  Se levou dano sem inimigos na tela, aproxime-se do mestre.
	if GetTick() > TimerIdleMove and (MyMotion == MOTION_HIT or WasHit or MyHP < LastMyHP) then
		TimerIdleMove = GetTick() + 4000
		if GetDistanceFromOwner(MyID) >= 3 and not RandomToGetClose then 
			MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY);
			RandomToGetClose = true
		elseif (RandomToGetClose and MyMotion ~= MOTION_MOVE) then
			MoveToRandom(MyID)
			RandomToGetClose = false
		elseif GetTick() > TimerToGetClose then TimerToGetClose = GetTick() + 10000; 
			--MoveToOwner(MyID);
			MoveToRandom(MyID)
			RandomToGetClose = false
			-- local oX, oY = BestMovementTo(OwnerID);
			-- oX = oX + math.random(-2, 2)
			-- oY = oY + math.random(-2, 2)
			-- MyDestX, MyDestY = RepairDest(MyID, oX, oY); Move(MyID, MyDestX, MyDestY);
		end
	end
end
---------------------------------------------------------------------------
function OnFOLLOW_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 5000; end
	Log("[OnFOLLOW_ST]");
	if GetTick() >= StateTimeOut[MyState] and MyState == FOLLOW_ST then
		Log("não é mais necessário seguir, tempo limite excedido");
		NeedToFollow = false;
		StateTimeOut[MyState] = nil
		if MyEnemy > 0 and GetDistance2(MyID, OwnerID) <= 7 then 
			if (MyState == FOLLOW_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			if GetDistance2(MyID, OwnerID) <= 7 then MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); end
			if (MyState == FOLLOW_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return;
	elseif (not NeedToFollow) then
		StateTimeOut[MyState] = nil
		Log("não é mais necessário seguir");
		if MyEnemy > 0 and GetDistance2(MyID, OwnerID) <= 7 then 
			if (MyState == FOLLOW_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			if GetDistance2(MyID, OwnerID) <= 7 then MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); end
			if (MyState == FOLLOW_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return;
	end

	UseAutoSkills()
	if (MyNearestEnemy > 0) then
		--if (GetDistance2(MyID, MyNearestEnemy) <= MyAttackRange) then
			Attack(MyID, MyNearestEnemy)
		--end
	else
		Attack(MyID, MyEnemy)
	end
	 
	if (MyMotion == MOTION_MOVE or LastMyMotion == MOTION_MOVE) then
		RemoveCall(ATTACK);
	end 
	MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY); 
end
---------------------------------------------------------------------------
TimerToTryRandomChase = 0
ForceMove             = false;
RandomTries           = 0
UseComboSkillChase    = true
-----------------------------
function OnCHASE_ST() 
---------------------------------------------------------------------------
	Log("[OnCHASE_ST]");
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 30000; end
	local distance = GetDistance2(OwnerID, MyID)
	local canChase = true; 
	if LongRangeShooter then
		local isDefensive = IsDefensiveEnemy(MyEnemy)
		
		if (not isDefensive) then canChase = false; end;
		
		if (distance > 1 and (not isDefensive or NeedToFollow)) then
			if NeedToGetClose then
				MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY); 
			end
		end
	elseif (NeedToFollow) then 
		StateTimeOut[MyState] = nil
		if (MyState == CHASE_ST) then
			OnFOLLOW_ST();
		end
		MyState = FOLLOW_ST;
		return;
	end
	--  TODO: get enemies...
	Log("[OnCHASE_ST] "..MyID.." => "..MyEnemy);
	if (MyEnemy == 0 or IsKS(MyEnemy) or IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
		Log("[OnCHASE_ST] inimigo inválido")
		StateTimeOut[MyState] = nil
		TimerToChangeTarget = 0
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
		if (MyState == CHASE_ST) then OnIDLE_ST(); end;
		MyState = IDLE_ST;
		return;
	end;
	if (GetTick() > StateTimeOut[MyState] and CanDoKS ~= MyEnemy and MyState == CHASE_ST) then
		Log("[OnCHASE_ST] tempo limite excedido")
		StateTimeOut[MyState] = nil
		TimerToChangeTarget = 0
		Unreachable[MyEnemy] = GetTick() + 20000;
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
		if (MyState == CHASE_ST) then OnIDLE_ST(); end;
		MyState = IDLE_ST;
		return;
	end;
	local eX, eY = GetV(V_POSITION, MyEnemy);
	if (MyState ~= LastMyState or MyEnemy ~= LastMyEnemy) then
		if (EnemiesInvisible[MyEnemy] ~= nil) then
		
			local success, failed = 
				pcall(GetBestCombo, -2, 0, MyEnemy, eX, eY); 
			if not success and failed ~= nil then pcall(Log, failed); end 
		end
	end
	if (IsInAttackSight(MyID, MyEnemy)) then
		Log("[OnCHASE_ST] atacar inimigo alcançado")
		--if (Motions[MyEnemy] == MOTION_STAND) then RemoveCall(MOVE); end
		if (Motions[MyEnemy] == MOTION_MOVE) then
			local x, y = BestMovementTo(MyEnemy); 
			MyDestX, MyDestY = RepairDest(MyID, x, y); 
			Move(MyID, MyDestX, MyDestY, true);
		end
		--StateTimeOut[ATTACK_ST] = nil;
		if (MyState == CHASE_ST) then OnATTACK_ST(); else Attack(MyID, MyEnemy, true); end;
		MyState = ATTACK_ST;
		return;
	end;
	
	if (UseComboSkillChase) then
		UseComboSkillChase    = false
		local success, failed = 
			pcall(GetBestCombo, (-1000 - MyState), 0, MyEnemy, eX, eY); 
		if not success and failed ~= nil then pcall(Log, failed); end 
	end
	UseAutoSkills()
	if (TimerToTryRandomChase == 0) then
		TimerToTryRandomChase = GetTick() + 6000
	end
	if (MyNearestEnemy > 0) then
		Attack(MyID, MyNearestEnemy)
	else
		Attack(MyID, MyEnemy)
	end
	if (MyMotion == MOTION_MOVE and LastMyMotion == MOTION_MOVE) and Motions[MyEnemy] == MOTION_MOVE then
		RemoveCall(ATTACK);
	end 
	if (MyMotion == MOTION_MOVE) then
		if (RandomTries == 0) then TimerToTryRandomChase = GetTick() + 6000; end;
	end
	if (RandomTries > 1 or (MyX == MyDestX and MyY == MyDestY)) then
		TimerToTryRandomChase = 0
		RandomTries           = 0
	end
	if (canChase) then
		if (GetTick() > TimerToTryRandomChase and MyState == CHASE_ST and AnyoneCouldMove) then
			if (MyMotion ~= MOTION_MOVE) then
				TimerToChangeTarget = 0
				Log("não consigo perseguir: tentar posição aleatória")
				if (MyState ~= CHASE_ST or ForceMove) then
					MoveToRandom(MyID, true)
					ForceMove = false;
				else
					MoveToRandom(MyID)
					ForceMove = true;
				end
				
				RandomTries = RandomTries + 1;
				return
			else
				Log("indo para posição aleatória")
			end
		else
			Log("tentando me mover normalmente")
			local x, y = BestMovementTo(MyEnemy); 
			MyDestX, MyDestY = RepairDest(MyID, x, y); 
		end
		if (MyState == CHASE_ST and not ForceMove) then
			Move(MyID, MyDestX, MyDestY);
			ForceMove = true
		else
			Move(MyID, MyDestX, MyDestY, true);
			ForceMove = false
		end
	end
end
---------------------------------------------------------------------------
TimerToAntiBug = 0;
ForceAttack    = false;
UseComboSkillAttack = true
LastAttackEX = -1
LastAttackEY = -1
-----------------------------
function OnATTACK_ST()
---------------------------------------------------------------------------
	Log("[OnATTACK_ST]");
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 30000; end
	local distance = GetDistance2(OwnerID, MyID)
	if LongRangeShooter then
		if (distance > 1 and (not IsDefensiveEnemy(MyEnemy) or NeedToFollow)) then
			if NeedToGetClose then
				MyDestX, MyDestY = RepairDest(MyID, BestMovementTo(OwnerID)); Move(MyID, MyDestX, MyDestY); 
			end
		end
	elseif (NeedToFollow) then 
		StateTimeOut[MyState] = nil
		if (MyState == ATTACK_ST) then
			OnFOLLOW_ST();
		end
		MyState = FOLLOW_ST;
		return;
	end
	if (MyEnemy == 0 or IsKS(MyEnemy) or IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
		Log("[OnATTACK_ST] inimigo inválido")
			--Log("Enemy type: "..GetV(V_TYPE, MyEnemy));
		StateTimeOut[MyState] = nil
		TimerToChangeTarget = 0
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
		if (MyState == ATTACK_ST) then OnIDLE_ST(); end;
		MyState = IDLE_ST;
		return;
	end;
	if (GetTick() > StateTimeOut[MyState] and CanDoKS ~= MyEnemy and MyState == ATTACK_ST) then
		Log("[OnATTACK_ST] tempo limite excedido")
		StateTimeOut[MyState] = nil
		TimerToChangeTarget = 0
		Unreachable[MyEnemy] = GetTick() + 20000;
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
		if (MyState == ATTACK_ST) then OnIDLE_ST(); end;
		MyState = IDLE_ST;
		return;
	end;
	if (not IsInAttackSight(MyID, MyEnemy)) then
		Log("[OnATTACK_ST] inimigo fora do alcance")
		--StateTimeOut[CHASE_ST] = nil;
		if (MyState == ATTACK_ST) then OnCHASE_ST(); end;
		MyState = CHASE_ST;
		return;
	end;
	local eX, eY = GetV(V_POSITION, MyEnemy);
	if (MyMotion == MOTION_MOVE and Motions[MyEnemy] ~= MOTION_MOVE and LastMotions[MyEnemy] ~= MOTION_MOVE
	and eX == LastAttackEX and eY == LastAttackEY) then
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY);
	elseif (Motions[MyEnemy] ~= MOTION_MOVE and LastMotions[MyEnemy] ~= MOTION_MOVE 
	and eX == LastAttackEX and eY == LastAttackEY) then
		RemoveCall(MOVE)
	elseif (eX ~= LastAttackEX or eY ~= LastAttackEY) then
		MyDestX, MyDestY = RepairDest(MyID, eX, eY); Move(MyID, MyDestX, MyDestY);
	end
	LastAttackEX = eX; LastAttackEY = eY;
	if (UseComboSkillAttack) then
		UseComboSkillAttack    = false
		local success, failed = 
			pcall(GetBestCombo, (-1000 - MyState), 0, MyEnemy, eX, eY); 
		if not success and failed ~= nil then pcall(Log, failed); end 
	end
	UseAutoSkills()
	if (MyState == ATTACK_ST and not ForceAttack) then
		Attack(MyID, MyEnemy);
		ForceAttack = true
	else
		Attack(MyID, MyEnemy, true);
		ForceAttack = false
	end;
	
	if (TimerToSnipe == 0) then
		TimerToSnipe = GetTick() + 4000
	end
	if (AutoSnipes ~= 0) then
		if (GetTick() > TimerToSnipe --and MyState == ATTACK_ST 
		and not LongRangeShooter) then
			if (List.containsV2(CCommands, SKILL_OBJECT)) then
				local command = SKILL_OBJECT
				local myID	= CCommandsData[command][1];
				local level	= CCommandsData[command][2];
				local skill	= CCommandsData[command][3];
				local id	= CCommandsData[command][4];
				
				local range = SkillRange(MyID, skill, level);
				if (range > MyAttackRange and id == MyEnemy 
				and skill ~= 8013) then
					if ((not IsPlayer(MyEnemy) 
					or (OwnerMotion       ~= MOTION_ATTACK
					and OwnerMotion       ~= MOTION_ATTACK2
					and LastOwnerMotion   ~= MOTION_ATTACK
					and LastOwnerMotion   ~= MOTION_ATTACK2
					and BygoneOwnerMotion ~= MOTION_ATTACK
					and BygoneOwnerMotion ~= MOTION_ATTACK2
					)
					) and CanDoKS ~= MyEnemy) then
						Log("snipe!")
						MySnipeSkill      = skill
						MySnipeSkillLevel = level
						MySnipeTarget     = id
						RemoveCall(SKILL_OBJECT)
						CheckingSkillState = -1
						CastCheck          = 0
						
						eX, eY = GetV(V_POSITION, id);
						local x, y; 
						local radius = range
						local angle = math.random(0, 360);
						local rX = math.floor(eX + radius * math.cos(angle));
						local rY = math.floor(eY + radius * math.sin(angle));
						x, y = rX, rY;
						MySnipeDestX, MySnipeDestY = RepairDest(MyID, x, y);
						
						TimerToSnipe = 0
						
						Log("[OnATTACK_ST] iniciar processo 'snipe'")
						StateTimeOut[SNIPE_ST] = nil
						if (MyState == ATTACK_ST) then OnSNIPE_ST(); end;
							
						MyState = SNIPE_ST
						return; 
					end
				end
			end
		end
	end
	
	--  Evade!
	if (AutoSnipes == 1 and AutoSkills ~= 0 and CanDoKS ~= MyEnemy) then	
		if (not IsPlayer(MyEnemy) 
		or (OwnerMotion       ~= MOTION_ATTACK
		and OwnerMotion       ~= MOTION_ATTACK2
		and LastOwnerMotion   ~= MOTION_ATTACK
		and LastOwnerMotion   ~= MOTION_ATTACK2
		and BygoneOwnerMotion ~= MOTION_ATTACK
		and BygoneOwnerMotion ~= MOTION_ATTACK2
		)
		) then
			if (IsOffensive(MyID, MyEnemy)) then
				if (MyHPPerc < MyEvadeHPPerc and MyHPPerc < MyAggroHPPerc and GetTick() > TimerToEvade) then
					Log("[OnATTACK_ST] evasão ou \"modo desespero\": \"I'm dying anyway, so... Whatever, let's do this!\"");
					StateTimeOut[EVADE_ST] = nil
					if (MyState == ATTACK_ST) then OnEVADE_ST(); end;
					MyState = EVADE_ST;
					return
				end
			end
		end
	end
	if (TimerToAntiBug == 0) then
		TimerToAntiBug = GetTick() + 12000
	end;
	if (not LongRangeShooter and GetTick() > TimerToAntiBug --and AnyoneCouldMove
	) then
		local eX, eY = GetV(V_POSITION, MyEnemy);
		local rX = math.random(-MyAttackRange, MyAttackRange)
		local rY = math.random(-MyAttackRange, MyAttackRange)
		MyDestX, MyDestY = RepairDest(MyID, eX + rX, eY + rY); Move(MyID, MyDestX, MyDestY);
		TimerToAntiBug = 0;
	end;
end;
---------------------------------------------------------------------------
ScheduledSnipeSkill = false;
DoneSnipeSkill      = false;
-----------------------------
function OnSNIPE_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 2000; end
	Log("[SNIPE_ST]")
	if (MyNearestEnemy > 0) then
		Attack(MyID, MyNearestEnemy)	
	else
		Attack(MyID, MyEnemy)
	end
if (MyMotion == MOTION_MOVE or LastMyMotion == MOTION_MOVE) then
		RemoveCall(ATTACK);
	end 
	if (MySnipeTarget == 0 or IsKS(MySnipeTarget) or IsOutOfSight(GetV(V_TARGET, MySnipeTarget), MySnipeTarget)) then
		ScheduledSnipeSkill = false;
		DoneSnipeSkill      = false;
		if MyEnemy > 0 then 
			if (MyState == SNIPE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == SNIPE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return;
	end
		
	if (ScheduledSnipeSkill) then
		if (DoneSnipeSkill) or (GetTick() >= StateTimeOut[MyState]) then		
			ScheduledSnipeSkill = false;
			DoneSnipeSkill      = false;
			if MyEnemy > 0 then 
				if (MyState == SNIPE_ST) then OnCHASE_ST(); end;
				MyState = CHASE_ST;
			else 
				MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
				if (MyState == SNIPE_ST) then OnIDLE_ST(); end;
				MyState = IDLE_ST;
			end; 
		end
		return;
	end
	MyDestX, MyDestY = RepairDest(MyID, MySnipeDestX, MySnipeDestY)
	Log("[SNIPE_ST] já cheguei?")
	
	if (MyX == MyDestX and MyY == MyDestY) 
	or StopSnipeNow 
	or (GetTick() > StateTimeOut[MyState] and MyState == SNIPE_ST) then
		
		Log("[SNIPE_ST] usar habilidade ("..MySnipeSkill..")."); 
		
		StateTimeOut[MyState] = GetTick() + 2000;
		
		ScheduledSnipeSkill = true;
		UseSkill(MyID, MySnipeSkillLevel, MySnipeSkill, MySnipeTarget); 
		return; 
	end
	Log("[SNIPE_ST] não, então mover")
	Move(MyID, MyDestX, MyDestY)
end
---------------------------------------------------------------------------
TimerToEvade     = 0
TimerToEvadeMove = 0
EvadeSkillSlot   = 0
EvadeMoveCount   = 0
EvadeForceAttack = false

TimerEvadeLimMove = 0
----------------------------- 
function OnEVADE_ST()
---------------------------------------------------------------------------
	if StateTimeOut[MyState] == nil then StateTimeOut[MyState] = GetTick() + 20000; end
		
	if (MyEnemy == 0 or IsKS(MyEnemy) or IsOutOfSight(GetV(V_TARGET, MyEnemy), MyEnemy)) then
		Log("[OnEVADE_ST] inimigo inválido")
			--Log("Enemy type: "..GetV(V_TYPE, MyEnemy));
		StateTimeOut[MyState] = nil
		TimerToChangeTarget = 0
		--TimerToEvade = GetTick() + 12000; 
		MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
		if (MyState == EVADE_ST) then OnIDLE_ST(); end;
		MyState = IDLE_ST;
		return;
	end;
	if (MyNearestEnemy > 0) then
		Attack(MyID, MyNearestEnemy)
	else
		Attack(MyID, MyEnemy)
	end
	
	--local enemyRange = GetV(V_ATTACKRANGE, MyEnemy)
	local eX, eY = GetV(V_POSITION, MyEnemy);
	--if (enemyRange == nil) then enemyRange = 1; end;
	local moveDis = 8;
	Log("[OnEVADE_ST] desviar de dano: "..moveDis)
	
	local canTryToAttack = false;
	if (GetTick() > TimerToEvadeMove) then TimerToEvadeMove = 0; EvadeMoveCount = 0; end;
	if (EvadeMoveCount < 3) then
		if (MyMotion ~= MOTION_MOVE) then
			if (MyMotion == MOTION_HIT or WasHit or GetDistance2(MyID, MyEnemy) <= moveDis / 2) then
			
				local x, y; 
				local radius = moveDis
				local angle = math.random(0, 360);
				local rX = math.floor(eX + radius * math.cos(angle));
				local rY = math.floor(eY + radius * math.sin(angle));
				x, y = rX, rY;
				MyDestX, MyDestY = RepairDest(MyID, x, y);
				--Move(MyID, MyDestX, MyDestY)
				EvadeMoveCount = EvadeMoveCount + 1
				
				--TimerToEvadeMove = GetTick() + 4000; 
			else
				canTryToAttack = true
			end
		end
	elseif (TimerToEvadeMove == 0) then 
		if (MyMotion ~= MOTION_MOVE and LastMyMotion ~= MOTION_MOVE) then
			TimerToEvadeMove = GetTick() + 4000;
		end
	end
	if (EvadeMoveCount > 0 and (MyX ~= MyDestX or MyY ~= MyDestY) 
		and GetDistance2(MyID, OwnerID) > 3) then
		Move(MyID, MyDestX, MyDestY)
	end
	if (MyMotion == MOTION_MOVE or LastMyMotion == MOTION_MOVE) and MyState == EVADE_ST then
		RemoveCall(ATTACK);
	end 
	
	if ((MyX == MyDestX and MyY == MyDestY) 
	or (MyDestX == LastMyDestX and MyDestY == LastMyDestY and MyMotion ~= MOTION_MOVE and LastMyMotion == MOTION_MOVE)
	
	or EvadeMoveCount >= 3
	
	or EvadeMoveCount == 0
	
	or StopSnipeNow
	
	or canTryToAttack
	
	or (TimerEvadeLimMove ~= 0 and GetTick() > TimerEvadeLimMove)
	) then		
		
		if (EvadeSkillSlot < 5) then
			if (CheckingSkillState == -1) then
				local success, failed = 
					pcall(GetBestCombo, -1, EvadeSkillSlot, MyEnemy, eX, eY); 
				if not success and failed ~= nil then pcall(Log, failed); end 
				EvadeSkillSlot = EvadeSkillSlot + 1;
			end
		end
		UseAutoSkills();
		
		TimerEvadeLimMove = 0
		
		if (CountEnemiesCloseTo(OwnerID) > 0) then
			Log("[OnEVADE_ST] inimigos atacando mestre! Voltar a atacar")
			if MyEnemy > 0 then 
				if (MyState == EVADE_ST) then OnCHASE_ST(); end;
				MyState = CHASE_ST;
			else 
				MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
				if (MyState == EVADE_ST) then OnIDLE_ST(); end;
				MyState = IDLE_ST;
			end; 
			return
		end
	else
		if (TimerEvadeLimMove == 0) then
			TimerEvadeLimMove = GetTick() + 4000
		end
	end;
	
	if ((EnemiesDefensiveH[MyEnemy] == nil and EnemiesDefensiveM[MyEnemy] == nil and EnemiesDefensiveL[MyEnemy] == nil)
	--or IsOffensive(OwnerID, MyEnemy)
	) then
		Log("[OnEVADE_ST] inimigo não está me atacando")
		StateTimeOut[MyState] = nil
		TimerToEvade = GetTick() + 8000; 
		--TimerToChangeTarget = 0
		--Unreachable[MyEnemy] = GetTick() + 20000;
		if MyEnemy > 0 then 
			if (MyState == EVADE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == EVADE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return
	end
	if (MyEnemy ~= LastMyEnemy) then
		Log("[OnEVADE_ST] troquei de inimigo")
		StateTimeOut[MyState] = nil
		TimerToEvade = GetTick() + 8000; 
		--TimerToChangeTarget = 0
		--Unreachable[MyEnemy] = GetTick() + 20000;
		if MyEnemy > 0 then 
			if (MyState == EVADE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == EVADE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return
	end
	if (not IsInAttackSight(MyID, MyEnemy) and (((MyMotion == MOTION_HIT or WasHit)
	and (math.abs(StateTimeOut[MyState] - GetTick()) <= 16000)) or Motions[MyEnemy] == MOTION_CAST or Motions[MyEnemy] == MOTION_SKILL)) then
		Log("[OnEVADE_ST] levando dano mesmo eu tentando fugir, cancelar evasão")
		StateTimeOut[MyState] = nil
		TimerToEvade = GetTick() + 8000; 
		--TimerToChangeTarget = 0
		--Unreachable[MyEnemy] = GetTick() + 20000;
		if MyEnemy > 0 then 
			if (MyState == EVADE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == EVADE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return
	end
	if (MyHPPerc >= MyEvadeHPPerc + 5) then
		Log("[OnEVADE_ST] HP recuperado")
		StateTimeOut[MyState] = nil
		TimerToEvade = GetTick() + 8000; 
		--TimerToChangeTarget = 0
		--Unreachable[MyEnemy] = GetTick() + 20000;
		if MyEnemy > 0 then 
			if (MyState == EVADE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == EVADE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return
	end
	if (GetTick() > StateTimeOut[MyState] and MyState == EVADE_ST) then
		Log("[OnEVADE_ST] tempo limite excedido")
		StateTimeOut[MyState] = nil
		TimerToEvade = GetTick() + 8000; 
		--TimerToChangeTarget = 0
		--Unreachable[MyEnemy] = GetTick() + 20000;
		if MyEnemy > 0 then 
			if (MyState == EVADE_ST) then OnCHASE_ST(); end;
			MyState = CHASE_ST;
		else 
			MyDestX, MyDestY = MyX, MyY; Move(MyID, MyDestX, MyDestY, true); 
			if (MyState == EVADE_ST) then OnIDLE_ST(); end;
			MyState = IDLE_ST;
		end; 
		return;
	end;
end
---------------------------------------------------------------------------
function RestartState(myState, renewTimer)
---------------------------------------------------------------------------
	if (renewTimer == nil) then renewTimer = false; end;
	--Log("restart state "..MyState.." from "..LastMyState)
	if (renewTimer) then StateTimeOut[myState] = nil; end;
	
	if (MyEnemy ~= LastMyEnemy) then
		Round = 1;
	end
	
	if     (myState == IDLE_ST  ) then
		TimerIdleMove         = GetTick() + 4000; 
		TimerToGetClose       = GetTick() + 10000; 
		--TimerToTestAngriffs   = GetTick() + 4000
		--TimerToUseSkill       = 0
		TimerCastleTravel = 0;
		
		Round = 1;
	elseif (myState == CHASE_ST ) then
		TimerToTryRandomChase = 0
		RandomTries           = 0
		UseComboSkillChase    = true
	elseif (myState == ATTACK_ST) then
		TimerToAntiBug        = 0;
		UseComboSkillAttack   = true
	elseif (myState == EVADE_ST ) then
		EvadeSkillSlot        = 0
		TimerEvadeLimMove     = 0
	end;
end
---------------------------------------------------------------------------
-- ========================================================================
--  PROCESSAMENTO DE HABILIDADES
-- ========================================================================
---------------------------------------------------------------------------
LastCheckingSkill           = 0
LastCheckingSkillLevel      = 1
LastSuccessfulCheckingSkill      = 0
LastSuccessfulCheckingSkillLevel = 1
----------------------------- 
LastSPTick   = 0
SPRegenValue = 0
----------------------------- 
function DetectSkillUse()
---------------------------------------------------------------------------
	--  Detector de recuperação de SP
	if (MySP > LastMySP and CheckingSkillState == -1) then
		LastSPTick   = GetTick();
		SPRegenValue = MySP - LastMySP
	end;
	
	if (CheckingSkillState == 1) then
		
		if (MyMotion ~= MOTION_CAST and LastMyMotion == MOTION_CAST) then
			if (CastUnbreakable) then
				
				RegisterCooldown(CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY);
				CheckingSkillState = -1
				CastRetry          = 0
			elseif (MyMotion == MOTION_HIT or WasHit) then
				CheckingSkillState = -1
				
				if (CastRetry <= 5 and CheckingSkill ~= 8023) then
					MyNextSkill                 = CheckingSkill  --  Combo
					MyNextSkillTimer            = 0  --  
					MyNextSkillLevel            = CheckingSkillLevel
					MyNextSkillTarget           = CheckingSkillTarget
					MyNextSkillX                = CheckingSkillX
					MyNextSkillY                = CheckingSkillY 
					CastRetry = CastRetry + 1
					
					--if (GetTick() > TimerToSnipe - 2000) then 
						TimerToSnipe = 0; 
					--end;
				else
					CastRetry = 0
				end
				Log("conjuração cancelada")
			end
			CastCheck = 0
			CheckingSkillTimer = GetTick() + 250
		elseif (MyMotion == MOTION_CAST) then
			MySPBeforeSkill = LastMySP
			MyHPBeforeSkill = LastMyHP
			Log("conjurando")
		elseif (CastCheck ~= 0 and GetTick() > CastCheck) or Merce ~= nil then
			CastCheck = 0
			CheckingSkillTimer = GetTick() + 250
			Log("habilidade não precisa de conjuração OU assistente não possui gesto de conjuração")
		end
		
		if (CheckingSkillState == 1) then
			if (CastCheck == 0) then
				if (GetTick() > CheckingSkillTimer) then
					if (SkillsFailed[CheckingSkill] == nil) then
						SkillsFailed[CheckingSkill] = 1
					elseif (SkillsFailed[CheckingSkill] > 1) then
						RegisterCooldown(CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY);
							
						SkillsFailed[CheckingSkill] = nil
					else
						SkillsFailed[CheckingSkill] = SkillsFailed[CheckingSkill] + 1
					end
					
					Log("habilidade anterior: "..LastCheckingSkill.."; habilidade com sucesso anterior: "..LastSuccessfulCheckingSkill.." ; habilidade atual: "..CheckingSkill..". Verificar se uma atrapalhou a outra.");
					local useDelayOnCombo = false;
					CountForDelay = CountForDelay + 1
					if (CountForDelay >= 3) then
						Round = LastRound;
						GlobalDelay = GetTick() + 4750
						CountForDelay = 0
					else
						GlobalDelay = GetTick() + 750
						if Skills[CheckingSkill] ~= nil then 
							if (Skills[CheckingSkill].HowLast ~= nil and Skills[CheckingSkill].TimeOut ~= nil and Skills[CheckingSkill].Engaged ~= nil and Skills[CheckingSkill].LastTarget ~= nil and Skills[CheckingSkill].TimeUsed ~= nil and Skills[CheckingSkill].Duration ~= nil and Skills[CheckingSkill].Reuse ~= nil) then
								if     (Skills[CheckingSkill].HowLast[CheckingSkillLevel] < 750) then
									GlobalDelay = GetTick() + Skills[CheckingSkill].HowLast[CheckingSkillLevel];
								end
							end
						end
						
						if (CheckingSkill ~= LastCheckingSkill and CheckingSkill ~= LastSuccessfulCheckingSkill) then
							local lastSuccessfulTime = 0;
							if Skills[LastSuccessfulCheckingSkill] ~= nil then 
								if (Skills[LastSuccessfulCheckingSkill].HowLast ~= nil and Skills[LastSuccessfulCheckingSkill].TimeOut ~= nil and Skills[LastSuccessfulCheckingSkill].Engaged ~= nil and Skills[LastSuccessfulCheckingSkill].LastTarget ~= nil and Skills[LastSuccessfulCheckingSkill].TimeUsed ~= nil and Skills[LastSuccessfulCheckingSkill].Duration ~= nil and Skills[LastSuccessfulCheckingSkill].Reuse ~= nil) then
									if (Skills[LastSuccessfulCheckingSkill].HowLast[LastSuccessfulCheckingSkillLevel] > 1000 and Skills[LastSuccessfulCheckingSkill].HowLast[LastSuccessfulCheckingSkillLevel] <= 5000) then
										Round = LastRound;
										useDelayOnCombo = true;
										lastSuccessfulTime = Skills[LastSuccessfulCheckingSkill].HowLast[LastSuccessfulCheckingSkillLevel] - 250;
										GlobalDelay = GetTick() + lastSuccessfulTime;
									end
								end
							end
							
							if Skills[LastCheckingSkill] ~= nil then 
								if (Skills[LastCheckingSkill].HowLast ~= nil and Skills[LastCheckingSkill].TimeOut ~= nil and Skills[LastCheckingSkill].Engaged ~= nil and Skills[LastCheckingSkill].LastTarget ~= nil and Skills[LastCheckingSkill].TimeUsed ~= nil and Skills[LastCheckingSkill].Duration ~= nil and Skills[LastCheckingSkill].Reuse ~= nil) then
									if (Skills[LastCheckingSkill].HowLast[LastCheckingSkillLevel] > 1000 and Skills[LastCheckingSkill].HowLast[LastCheckingSkillLevel] <= 5000) then
										if (Skills[LastCheckingSkill].HowLast[LastCheckingSkillLevel] > lastSuccessfulTime) then
											Round = LastRound;
											useDelayOnCombo = true;
											GlobalDelay = GetTick() + Skills[LastCheckingSkill].HowLast[LastCheckingSkillLevel] - 250;
										end
									end
								end
							end
						end
					end
					if (Round < 1) then Round = Total + Round; end;
					if (Round < 1) then Round = 1; end;
					if (useDelayOnCombo and Available[Round]) then
						Log("habilidade "..LastCheckingSkill.." ou "..LastSuccessfulCheckingSkill.." atrapalhou a habilidade "..CheckingSkill..". Tentar novamente após: "..(GlobalDelay - GetTick()).." ms.");
						Log("rodada "..Round..": habilidade "..Available[Round].Skill);
					end
					
					if (CheckingSkill == 8028 --or CheckingSkill == 8029 or CheckingSkill == 8030
					) and not useDelayOnCombo then
						MyStyle = STYLE_GRAPP
					end
					if (CheckingSkill == 8029 or CheckingSkill == 8030
					) then
						local success, failed = 
							pcall(GetBestCombo, CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY); 
						if not success and failed ~= nil then pcall(Log, failed); end 
					end
					if (CheckingSkill == 8036 --or CheckingSkill == 8037 or CheckingSkill == 8038
					) and not useDelayOnCombo then
						MyStyle = STYLE_FIGHT
					end
					if (CheckingSkill == 8037 or CheckingSkill == 8038
					) then
						local success, failed = 
							pcall(GetBestCombo, CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY); 
						if not success and failed ~= nil then pcall(Log, failed); end 
					end
					
					if (useDelayOnCombo) then
						MyNextSkillTimer = GlobalDelay;
					end
					CheckingSkillState = -1
					CastRetry          = 0
					Log("habilidade falhou: "..CheckingSkill)
					NeedsCastling = 0
					TimerNeedsCastling = 0
					if (CheckingSkill == 8005) then
						IgnoreCastlingReDo = false
						
						WasHitCastling = false
					end
					
					LastCheckingSkill      = CheckingSkill
					LastCheckingSkillLevel = CheckingSkillLevel
					
					
				elseif (MySP < MySPBeforeSkill) 
				or (MySP - SPRegenValue < MySPBeforeSkill and GetTick() - LastSPTick < 4000)
				or MyMotion == MOTION_SKILL or Merce ~= nil 
				or (CheckingSkillTarget == MyID)
				then
					RegisterCooldown(CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY);
					SkillsFailed[CheckingSkill] = nil
					CheckingSkillState = -1
					CastRetry          = 0
					Log("habilidade usada com sucesso: "..CheckingSkill)
					
					--CountForDelay = CountForDelay + 1
					--if (CountForDelay >= 3) then
					--	GlobalDelay = GetTick() + 3000
					--	CountForDelay = 0
					--else
						GlobalDelay = GetTick() + 1000
						if Skills[CheckingSkill] ~= nil then 
							if (Skills[CheckingSkill].HowLast ~= nil and Skills[CheckingSkill].TimeOut ~= nil and Skills[CheckingSkill].Engaged ~= nil and Skills[CheckingSkill].LastTarget ~= nil and Skills[CheckingSkill].TimeUsed ~= nil and Skills[CheckingSkill].Duration ~= nil and Skills[CheckingSkill].Reuse ~= nil) then
								if (Skills[CheckingSkill].HowLast[CheckingSkillLevel] < 1000) then
									GlobalDelay = GetTick() + Skills[CheckingSkill].HowLast[CheckingSkillLevel];
								end
							end
						end
					--end
					
					if (CheckingSkill == 8027) then
						if (MyStyle == STYLE_FIGHT) then
							MyStyle = STYLE_GRAPP
						else
							MyStyle = STYLE_FIGHT
						end
					end
					if (CheckingSkill == 8028 or CheckingSkill == 8029 or CheckingSkill == 8030) then
						MyStyle = STYLE_FIGHT
					end
					if (CheckingSkill == 8036 or CheckingSkill == 8037 or CheckingSkill == 8038) then
						MyStyle = STYLE_GRAPP
					end
					if (CheckingSkill == 8005) then
						if (NeedsCastling > 0) then 
							NeedsCastling  = 0
							TimerNeedsCastling = 0
						elseif (not IgnoreCastlingReDo) then
							NeedsCastling = GetTick() + 2000
							TimerNeedsCastling = 0
						else
							NeedsCastling  = 0
							TimerNeedsCastling = 0
						end
						
						IgnoreCastlingReDo = false
						
						WasHitCastling = false
					end
					local success, failed = 
						pcall(GetBestCombo, CheckingSkill, CheckingSkillLevel, CheckingSkillTarget, CheckingSkillX, CheckingSkillY); 
					if not success and failed ~= nil then pcall(Log, failed); end 
					
					LastSuccessfulCheckingSkill      = CheckingSkill
					LastSuccessfulCheckingSkillLevel = CheckingSkillLevel
					
					LastCheckingSkill      = CheckingSkill
					LastCheckingSkillLevel = CheckingSkillLevel
					
				end
			end;
		end
	end
		
	RefreshCooldowns() 
end
---------------------------------------------------------------------------
function RefreshCooldowns() 
---------------------------------------------------------------------------
	
	for i, v in pairs(Buffed) do 
		if (GetTick() > v) then
			Buffed[i] = nil;
		end
	end
	
	for i, v in pairs(Skills) do 
		if Skills[i].Engaged then
			if GetTick() > Skills[i].TimeOut then Skills[i].Engaged = false; end;
		end
		
		if Skills[i].Reuse ~= nil then 
			if Skills[i].Reuse ~= 0 then
				if GetTick() > Skills[i].Reuse then Skills[i].Reuse = 0; 
				else
					--  Tentar usar Cinzas Vulcânicas novamente caso troque de inimigo.
					if     i == 8043 then 
						if (MyEnemy ~= LastMyEnemy or MyState ~= LastMyState) then
							if (Skills[i].Reuse > GetTick() + 3000) then
								Skills[i].Reuse = GetTick() + 3000;
							end
						end
						
					--  Tentar usar Derretimento com Lava novamente, caso inimigo sofra dano ou eu mude de alvo.
					elseif i == 8041 then 
						if (MyEnemy ~= LastMyEnemy) then
							if (Skills[i].Reuse > GetTick() + 1000) then
								Skills[i].Reuse = GetTick() + 1000;
							end
						elseif (MyEnemy > 0) then
							if (Skills[i].Reuse > GetTick() + 1000 and Motions[MyEnemy] == MOTION_HIT) then
								Skills[i].Reuse = GetTick() + 1000;
							end
						end
						
					--  Tentar usar Convocação novamente, caso eu mude de alvo.
					elseif i == 8018 then 
						if (MyEnemy ~= LastMyEnemy) then
							if (Skills[i].Reuse > GetTick() + 3000) then
								Skills[i].Reuse = GetTick() + 3000;
							end
						end
						
					--  Tentar usar Brisa da Calmaria novamente, caso eu mude de alvo.
					elseif i == 8026 then 
						if (MyEnemy ~= LastMyEnemy) then
							if (Skills[i].Reuse > GetTick() + 1000) then
								Skills[i].Reuse = GetTick() + 1000;
							end
						elseif Motions[MyEnemy] == MOTION_CAST or Motions[MyEnemy] == MOTION_SKILL then
							Skills[i].Reuse = 0;
						end
						
					--  Tentar usar Esquiva especial novamente ao levar dano.
					elseif i == 8023 then 
						if (MyMotion == MOTION_HIT) then
							if     (Skills[i].Reuse > GetTick() + 30000) then
								Skills[i].Reuse = GetTick() + ((Skills[i].Reuse - GetTick()) / 2);
							elseif (Skills[i].Reuse > GetTick() + 15000) then
								Skills[i].Reuse = GetTick() + 15000;
							end
						end
						
					
					--					
					elseif i == 8232 then 
						if (MyEnemy ~= LastMyEnemy) then
							if (Skills[i].Reuse > GetTick() + 1000) then
								Skills[i].Reuse = GetTick() + 1000;
							end
						end
						
					--	
					elseif i == 8234 then 
						if (MyEnemy ~= LastMyEnemy) then
							if (Skills[i].Reuse > GetTick() + 1000) then
								Skills[i].Reuse = GetTick() + 1000;
							end
						end
					end
				end
			end
		end
	end
end
---------------------------------------------------------------------------
function RegisterCooldown(skill, level, target, areaX, areaY) 
---------------------------------------------------------------------------
	
	-- if (skill == 8035) then
		-- if (RemovingAngriffs) then
			-- RemovingAngriffs = false
			
			-- RemoveCooldown(skill) 
			-- return
		-- end
	-- end
	
	if (CastUnbreakable) then TimerToSnipe = GetTick() + 12000; end
	
	if Skills[skill] ~= nil then 
		if (Skills[skill].HowLast ~= nil and Skills[skill].TimeOut ~= nil and Skills[skill].Engaged ~= nil and Skills[skill].LastTarget ~= nil and Skills[skill].TimeUsed ~= nil and Skills[skill].Duration ~= nil and Skills[skill].Reuse ~= nil) then
			
			Skills[skill].TimeOut = GetTick() + Skills[skill].HowLast[level];
				
			Skills[skill].Engaged = true;
			
			Skills[skill].LastTarget = target; Skills[skill].TimeUsed = GetTick()
			
			if (Skills[skill].Duration[level] ~= nil) then 
				Skills[skill].Reuse = Skills[skill].TimeUsed + Skills[skill].Duration[level]; 
			end
		end
	end
end
---------------------------------------------------------------------------
function RemoveCooldown(skill) 
---------------------------------------------------------------------------
	
	if Skills[skill] ~= nil then 
		if (Skills[skill].HowLast ~= nil and Skills[skill].TimeOut ~= nil and Skills[skill].Engaged ~= nil and Skills[skill].LastTarget ~= nil and Skills[skill].TimeUsed ~= nil and Skills[skill].Duration ~= nil and Skills[skill].Reuse ~= nil) then
			
			Skills[skill].Engaged = false;
			
			Skills[skill].Reuse = 0;
		end
	end
end
---------------------------------------------------------------------------
TimerToSnipe       = 0;
-----------------------------
function UseAutoSkills()
---------------------------------------------------------------------------	
	if (TimerToUseSkill ~= 0 and (GetTick() > TimerToUseSkill or MyState == ATTACK_ST)) then
		TimerToUseSkill = 0
	end
	if (TimerToUseSkill ~= 0) then return; end;

	if (AutoSkills == 0) then return; end;
		
	if (List.containsV2(CCommands, SKILL_OBJECT) or List.containsV2(CCommands, SKILL_GROUND)) then 
		Log("não usar habilidades: outra habilidade já agendada") 
		return; 
	end
	if (MyNextSkill == 0) then
		if (MyMotion == MOTION_CAST and CastCheck ~= 0) then 
			Log("não usar habilidades: conjurando") 
		return; end;
		
		if (CheckingSkillState >= 0)  then 
			Log("não usar habilidades: verificando uso de habilidade anterior") 
		return; end;
		
		if (GetTick() <= GlobalDelay) then 
			Log("não usar habilidades: delay global") 
		return; end;
	end
	
	LastRound = Round
	local success, failed = 
		pcall(GetAndUseBestSkill); 
	if not success and failed ~= nil then pcall(Log, failed); end 
end
---------------------------------------------------------------------------
function UseSkill(myID, level, skill, id, force) 
---------------------------------------------------------------------------
	if (force == nil) then force = false; end;
	--  TODO: registrar e checar cooldowns
	
	if (not force) then
		if not IsValidSkillTarget(id, skill) then
			return
		end
		if Skills[skill] ~= nil then
			if Skills[skill].Engaged then
				return
			end
		end
	end
	Log("usar habilidade "..skill.." em "..id)
	CheckingSkillState = 0
	if (skill == 8005 and not IgnoreCastlingReDo) then
		NeedsCastling = -1
	end
	SkillObject(myID, level, skill, id); 
end
---------------------------------------------------------------------------
function UseAreaSkill(myID, level, skill, x, y, force) 
---------------------------------------------------------------------------
	if (force == nil) then force = false; end;
	if (not force) then
		if Skills[skill] ~= nil then
			if Skills[skill].Engaged then
				return
			end
		end
	end
	Log("usar habilidade "..skill.." em "..x..", "..y)
	CheckingSkillState = 0
	SkillGround(myID, level, skill, x, y);
end
---------------------------------------------------------------------------