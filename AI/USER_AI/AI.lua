---------------------------------------------------------------------------
Homun                              = 0
------------------------------------------
Initialized                        = false
---------------------------------------------------------------------------
function AI(myID)
---------------------------------------------------------------------------
	local success, result
	
	if not Initialized then
		local tryOld = false;
		TraceAI("[HOMUN] carregando arquivos da AI no método moderno");
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/Constantes.lua")
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/Utilidades.lua"  )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/GibraltarAI4.lua")
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/ID DATA/MVPs.lua"     )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/ID DATA/Types.lua"    )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/ID DATA/Skills.lua"   )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/Habilidades.lua"      )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		TraceAI("[HOMUN] fim do carregamento");
		---------------------------------------------------------------
		if (tryOld) then
			TraceAI("[HOMUN] carregando arquivos da AI no método antigo");
			success, result = pcall(require, 
				"AI\\USER_AI\\CORE\\Constantes"  )
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\CORE\\Utilidades"  )
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\CORE\\GibraltarAI4")
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\ID DATA\\MVPs"     )
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\ID DATA\\Types"    )
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\ID DATA\\Skills"   )
			if not success and result ~= nil then pcall(TraceAI, result); end
			success, result = pcall(require, 
				"AI\\USER_AI\\Habilidades"       )
			if not success and result ~= nil then pcall(TraceAI, result); end
			TraceAI("[HOMUN] fim do carregamento");
		end;
	Initialized = true; end
	
	local homun = 0; success, homun = pcall(GetMyType, myID)
	if not success and homun ~= nil then pcall(TraceAI, homun); else Homun = homun; end
	
	success, result = pcall(AI_Sec, myID)
	if not success and result ~= nil then pcall(TraceAI, result); end
end
---------------------------------------------------------------------------
function GetMyType(myID)
---------------------------------------------------------------------------
return GetV(V_HOMUNTYPE, myID); end
---------------------------------------------------------------------------