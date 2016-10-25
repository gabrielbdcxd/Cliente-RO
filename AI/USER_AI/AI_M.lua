---------------------------------------------------------------------------
Merce                              = 0
------------------------------------------
Initialized                        = false
---------------------------------------------------------------------------
function AI(myID)
---------------------------------------------------------------------------
	local success, result
	
	if not Initialized then
		local tryOld = false;
		TraceAI("[MERCE] tentando carregar jogo no método moderno.");
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/Constantes.lua"  )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/Utilidades.lua"  )
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/CORE/GibraltarAI4.lua")
		if not success and result ~= nil then pcall(TraceAI, result); tryOld = true; end
		success, result = pcall(dofile, 
			"./AI/USER_AI/ID DATA/MvPs.lua"     )
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
		TraceAI("[MERCE] ...fim do carregamento.");
		---------------------------------------------------------------
		if (tryOld) then
			TraceAI("[MERCE] tentando carregar jogo no método antigo.");
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
				"AI\\USER_AI\\ID DATA\\MvPs"     )
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
			TraceAI("[MERCE] ...fim do carregamento.");
		end;
	Initialized = true; end
	
	local merce = 0; success, merce = pcall(GetMyType, myID)
	if not success and merce ~= nil  then pcall(TraceAI, merce);  else Merce = merce; end
	
	success, result = pcall(AI_Sec, myID)
	if not success and result ~= nil then pcall(TraceAI, result); end
end
---------------------------------------------------------------------------
function GetMyType(myID)
---------------------------------------------------------------------------
	local merce = GetV(V_MERTYPE, myID)
	
	--  Detecção de assistentes de ROPs.
	if merce == 1 then
		local hp = GetV(V_MAXHP, myID); local sp = GetV(V_MAXSP, myID)
		if     (hp >= 256  ) and (hp <= 323  ) and (sp >= 200) and (sp <= 252) then merce = 1;   --  Arqueira nv. 1 (comum).
		elseif (hp >= 6120 ) and (hp <= 7712 ) and (sp >= 182) and (sp <= 230) then merce = 201; --  Mímico.
		elseif (hp >= 10000) and (hp <= 12600) and (sp >= 221) and (sp <= 279) then merce = 202; --  Alice.
		elseif (hp >= 7800 ) and (hp <= 9800 ) and (sp >= 200) and (sp <= 250) then merce = 203; --  Egnigem Cenia ou Doppelganger.
		elseif (hp >= 9800 ) and (hp <= 10000) and (sp >= 200) and (sp <= 250) then merce = 204; --  Eddga.
		elseif (hp >= 7000 ) and (hp <= 8500 ) and (sp >= 250) and (sp <= 320) then merce = 206; --  Assistente GM.
		elseif (hp >= 7513 ) and (hp <= 8500 ) and (sp >= 201) and (sp <= 250) then merce = 207; --  Pingu.
		elseif (hp >= 12300) and (hp <= 14500) and (sp >= 450) and (sp <= 600) then merce = 208; --  Ísis.
		else merce = 200; end end                                                                --  Desconhecido.
return merce; end
---------------------------------------------------------------------------