-- ========================================================================
--  TÁTICAS
-- ========================================================================
BEHA_DEFEND             = 1
BEHA_ATTACK             = 2
-- ========================================================================
--  REFERÊNCIAS DE FUNÇÕES C DO JOGO
-- ========================================================================
--[[
function TraceAI(string) end
function MoveToOwner(id) end
function Move(id, x, y)  end
function Attack(id, id)  end
function GetV(V_, id)    end
function GetActors()     end
function GetTick()       end
function GetMsg(id)      end
function GetResMsg(id)   end
function SkillObject(id, level, skill, target) end
function SkillGround(id, level, skill, x, y)   end
function IsMonster(id)   end
--]]
-- ========================================================================
--  CONSTANTES PARA FUNÇÃO GETV
-- ========================================================================
V_OWNER	                          = 0
V_POSITION                        = 1
V_TYPE                            = 2
V_MOTION                          = 3
V_ATTACKRANGE                     = 4
V_TARGET                          = 5
V_SKILLATTACKRANGE                = 6 --  Não funciona muito bem, use V_SKILLATTACKRANGE_LEVEL.
V_HOMUNTYPE                       = 7
V_HP                              = 8
V_SP                              = 9
V_MAXHP                           = 10
V_MAXSP                           = 11
V_MERTYPE                         = 12
V_POSITION_APPLY_SKILLATTACKRANGE = 13
V_SKILLATTACKRANGE_LEVEL          = 14
---------------------------------------------------------------------------
-- ========================================================================
--  CONSTANTES DE COMANDOS
-- ========================================================================
NONE_CMD                = 0
MOVE_CMD                = 1
STOP_CMD                = 2
ATTACK_OBJECT_CMD       = 3
ATTACK_AREA_CMD         = 4
PATROL_CMD              = 5
HOLD_CMD                = 6
SKILL_OBJECT_CMD        = 7
SKILL_AREA_CMD          = 8
FOLLOW_CMD              = 9
-- ========================================================================
--  HOMUNCULUS
-- ========================================================================
LIF                     = 1
AMISTR                  = 2
FILIR                   = 3
VANILMIRTH              = 4
LIF2                    = 5
AMISTR2                 = 6
FILIR2                  = 7
VANILMIRTH2             = 8
LIF_H                   = 9
AMISTR_H                = 10
FILIR_H                 = 11
VANILMIRTH_H            = 12
LIF_H2                  = 13
AMISTR_H2               = 14
FILIR_H2                = 15
VANILMIRTH_H2           = 16
-----------------------------  
--  TIPO S
-----------------------------  
EIRA                    = 48
BAYERI                  = 49
SERA                    = 50
DIETER                  = 51
ELEANOR                 = 52
-----------------------------  
--  ESTILOS DA ELEANOR
-----------------------------  
STYLE_FIGHT    = 1
STYLE_GRAPP    = 2
---------------------------------------------------------------------------
-- ========================================================================
--  ASSISTENTES
-- ========================================================================
ARCHER01                = 1		
ARCHER02                = 2			
ARCHER03                = 3	
ARCHER04                = 4
ARCHER05                = 5
ARCHER06                = 6
ARCHER07                = 7
ARCHER08                = 8
ARCHER09                = 9
ARCHER10                = 10
LANCER01                = 11
LANCER02                = 12
LANCER03                = 13
LANCER04                = 14
LANCER05                = 15
LANCER06                = 16
LANCER07                = 17
LANCER08                = 18
LANCER09                = 19
LANCER10                = 20
SWORDMAN01              = 21		
SWORDMAN02              = 22	
SWORDMAN03              = 23
SWORDMAN04              = 24
SWORDMAN05              = 25
SWORDMAN06              = 26
SWORDMAN07              = 27
SWORDMAN08              = 28
SWORDMAN09              = 29
SWORDMAN10              = 30
---------------------------------------------------------------------------
-- ========================================================================
--  GESTOS
-- ========================================================================
----------------------------- 
--  BÁSICOS
----------------------------- 
MOTION_STAND            = 0
MOTION_MOVE             = 1
MOTION_ATTACK           = 2
MOTION_DEAD             = 3
MOTION_HIT              = 4
MOTION_PICKUP           = 5
MOTION_SIT              = 6
MOTION_SKILL            = 7
MOTION_CAST             = 8
MOTION_ATTACK2          = 9
----------------------------- 
--  KNIGHT
----------------------------- 
MOTION_COUNTER          = 13 --  Counter Attack.
----------------------------- 
--  HUNTER
----------------------------- 
MOTION_FOCUSED_ARROW    = 18
----------------------------- 
--  ALCHEMIST
----------------------------- 
MOTION_TOSS             = 12 --  Toss something (spear boomerang, aid potion).
MOTION_BIGTOSS          = 28 --  A heavier toss (slim potions / acid demonstration).
----------------------------- 
--  BARD / DANCER
----------------------------- 
MOTION_DANCE            = 16
MOTION_SING             = 17
----------------------------- 
--  TAEKWON KID
----------------------------- 
MOTION_TK_LEAP_UP       = 19
MOTION_TK_LEAP_DOWN     = 20
MOTION_TK_LEAP_LAND     = 25

MOTION_TK_STANCE_TORNADO    = 21
MOTION_TK_STANCE_HEELDROP   = 22
MOTION_TK_STANCE_ROUNDHOUSE = 23
MOTION_TK_STANCE_COUNTER    = 24
MOTION_TK_TUMBLING          = 25 --  Same as MOTION_TK_LEAP_LAND.

MOTION_TK_LEAP_LAND     = 25
MOTION_TK_COUNTER       = 26
MOTION_TK_FLYINGKICK    = 27
MOTION_TK_TORNADO       = 30
MOTION_TK_HEELDROP      = 31
MOTION_TK_ROUNDHOUSE    = 32
-----------------------------
--  TAEKWON MASTER
-----------------------------
MOTION_TKM_PROTECTION   = 33
MOTION_TKM_HEAT         = 34
-----------------------------
--  SOUL LINKER
-----------------------------
MOTION_SL_LINK          = 23 --  Casting Link skill.
-----------------------------
--  Ninja motions
-----------------------------
MOTION_NJ_BENDING       = 35 --  ?
MOTION_NJ_SKILL         = 36 --  Used a skill.
MOTION_NJ_CASTING       = 37 --  Casting a skill.
-----------------------------
--  GUNSLINGER
-----------------------------
MOTION_GS_DESPERADO         = 38
MOTION_GS_COIN              = 39
MOTION_GS_GATLING           = 40
MOTION_GS_CASTING           = 41 --  Casting a skill.
MOTION_GS_FULLBLAST         = 42
---------------------------------------------------------------------------
-- ========================================================================
--  PVP DATABASE 
-- ========================================================================
NOVICE                      = 0
-----------------------------
--  SWORDSMAN
-----------------------------
SWORDSMAN                   = 1
-----------------------------
KNIGHT                      = 7
KNIGHT_PECO                 = 13
RUNE_KNIGHT                 = 4060
RUNE_KNIGHT_DRAGON          = 4081
-----------------------------
CRUSADER                    = 14
CRUSADER_PECO               = 21
-----------------------------
--  MAGE
-----------------------------
MAGE                        = 2
-----------------------------
WIZARD                      = 9
HIGH_WIZARD                 = 4010
WARLOCK                     = 4061
-----------------------------
SAGE                        = 16
-----------------------------
--  ARCHER
-----------------------------
ARCHER                      = 3
-----------------------------
HUNTER                      = 11
SNIPER                      = 4012
RANGER                      = 4062
RANGER_WARG                 = 4085
-----------------------------
BARD                        = 19
MINSTREL                    = 4020
MAESTRO                     = 4075
DANCER                      = 20
-----------------------------
--  ACOLYTE
-----------------------------
ACOLYTE                     = 4
-----------------------------
PRIEST                      = 8 
HIGH_PRIEST                 = 4009 
ARCH_BISHOP                 = 4063
-----------------------------
MONK                        = 15
SURA                        = 4077
-----------------------------
--  MERCHANT
-----------------------------
MERCHANT                    = 5
-----------------------------
BLACKSMITH                  = 10
MASTERSMITH                 = 4011
MECHANIC                    = 4064
MECHANIC_MADOGEAR           = 4087
-----------------------------
ALCHEMIST                   = 18
BIOCHEMIST                  = 4019
GENETICIST                  = 4078
-----------------------------
--  THIEF
-----------------------------
THIEF                       = 6
-----------------------------
ASSASSIN                    = 12
-----------------------------
ROGUE                       = 17
-----------------------------
--  EXPANDED
-----------------------------
SUPER_NOVICE                = 23
-----------------------------
GUNSLINGER                  = 24
-----------------------------
NINJA                       = 25
KAGEROU                     = 4211
OBORO                       = 4212
-----------------------------
GAME_MASTER_MALE            = 2000
GAME_MASTER_FEMALE          = 2001
-----------------------------
UNKNOWN                     = 22
-----------------------------
PORTAL                      = 45
---------------------------------------------------------------------------
-- ========================================================================
--  ARQUIVOS TXT
-- ========================================================================
-----------------------------
FILES                   = {}
-----------------------------
--  HOMUNCULUS
-----------------------------
HOMUNCULUS              = {}
HOMUNCULUS.ID           = "./AI/USER_AI/TEMP/H_ID.txt"

HOMUNCULUS.TYPES_TEMP	= "./AI/USER_AI/TEMP/TYPES.txt"
HOMUNCULUS.TYPES   		= "./AI/USER_AI/ID DATA/Types.lua"

HOMUNCULUS.AGGRO_TO_ALL = "./AI/USER_AI/ID DATA/H_AGGRESSIVE.txt"
HOMUNCULUS.BEHA         = "./AI/USER_AI/ID DATA/H_BEHA.txt"

HOMUNCULUS.FRIENDS      = "./AI/USER_AI/ID DATA/H_FRIENDS.txt"

HOMUNCULUS.NO_SKILLS    = "./AI/USER_AI/ID DATA/H_NO_SKILLS.txt"

HOMUNCULUS.USE_BUFFS    = "./AI/USER_AI/ID DATA/H_USE_BUFFS.txt"

HOMUNCULUS.NO_SNIPES    = "./AI/USER_AI/ID DATA/H_NO_SNIPES.txt"
HOMUNCULUS.NO_EVADES    = "./AI/USER_AI/ID DATA/H_NO_EVADES.txt"

HOMUNCULUS.TRAVEL       = "./AI/USER_AI/ID DATA/H_TRAVEL.txt"

HOMUNCULUS.NO_CHASES    = "./AI/USER_AI/ID DATA/H_NO_CHASES.txt"

HOMUNCULUS.DANGER_STATE = "./AI/USER_AI/TEMP/H_LOW_HP.txt"

HOMUNCULUS.LOG          = "./AI/USER_AI/TEMP/H_LOG.txt"

FILES[1]                = HOMUNCULUS
-----------------------------
--  ASSISTENTE
-----------------------------
ASSISTENTE              = {}
ASSISTENTE.ID           = "./AI/USER_AI/TEMP/M_ID.txt"

ASSISTENTE.TYPES_TEMP	= "./AI/USER_AI/TEMP/TYPES.txt"
ASSISTENTE.TYPES   		= "./AI/USER_AI/ID DATA/Types.lua"

ASSISTENTE.AGGRO_TO_ALL = "./AI/USER_AI/ID DATA/M_AGGRESSIVE.txt"
ASSISTENTE.BEHA         = "./AI/USER_AI/ID DATA/M_BEHA.txt"

ASSISTENTE.FRIENDS      = "./AI/USER_AI/ID DATA/M_FRIENDS.txt"

ASSISTENTE.NO_SKILLS    = "./AI/USER_AI/ID DATA/M_NO_SKILLS.txt"

ASSISTENTE.USE_BUFFS    = "./AI/USER_AI/ID DATA/M_USE_BUFFS.txt"

ASSISTENTE.NO_SNIPES    = "./AI/USER_AI/ID DATA/M_NO_SNIPES.txt"
ASSISTENTE.NO_EVADES    = "./AI/USER_AI/ID DATA/M_NO_EVADES.txt"

ASSISTENTE.TRAVEL       = "./AI/USER_AI/ID DATA/M_TRAVEL.txt"

ASSISTENTE.NO_CHASES    = "./AI/USER_AI/ID DATA/M_NO_CHASES.txt"

ASSISTENTE.DANGER_STATE = "./AI/USER_AI/TEMP/M_LOW_HP.txt"

ASSISTENTE.LOG          = "./AI/USER_AI/TEMP/M_LOG.txt"

FILES[2]                = ASSISTENTE
---------------------------------------------------------------------------