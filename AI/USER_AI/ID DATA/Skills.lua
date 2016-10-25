-- ========================================================================
--  SKILLS DE HOMUNCULUS
-- ========================================================================
---------------------------------------------------------------------------
-- ========================================================================
--  AMISTR
-- ========================================================================
---------------------------------------------------------------------------
Skill8005          = {}; Skill8005.MaxLevel = 5; Skill8005.String = "Troca de Lugar (Roque)";
Skill8005.MinSP = {}; Skill8005.Range = {}; Skill8005.HowLast = {}; Skill8005.Duration = {}; for i = 1, Skill8005.MaxLevel, 1 do 
					Skill8005.MinSP[i]    = 10; 
					Skill8005.Range[i]    = 15
					Skill8005.HowLast[i]  = 1000
					Skill8005.Duration[i] = 0
end
Skill8005.TimeUsed = 0; Skill8005.TimeOut = 0; Skill8005.Engaged = false; Skill8005.LastTarget = 0; Skill8005.Reuse = 0; Skills[8005] = Skill8005;
---------------------------------------------------------------------------
Skill8006          = {}; Skill8006.MaxLevel = 5; Skill8006.String = "Fortaleza"; 
Skill8006.MinSP = {}; Skill8006.Range = {}; Skill8006.HowLast = {}; Skill8006.Duration = {}; for i = 1, Skill8006.MaxLevel, 1 do 
					Skill8006.MinSP[i]    = 15 + (5 * i) 
					Skill8006.Range[i]    = 15
					Skill8006.HowLast[i]  = 30000
					Skill8006.Duration[i] = 45000 - (5000 * i)
end
Skill8006.TimeUsed = 0; Skill8006.TimeOut = 0; Skill8006.Engaged = false; Skill8006.LastTarget = 0; Skill8006.Reuse = 0; Skills[8006] = Skill8006;
---------------------------------------------------------------------------
Skill8008          = {}; Skill8008.MaxLevel = 3; Skill8008.String = "Sede de Sangue"; 
Skill8008.MinSP = {}; Skill8008.Range = {}; Skill8008.HowLast = {}; Skill8008.Duration = {}; for i = 1, Skill8008.MaxLevel, 1 do 
					Skill8008.MinSP[i]    = 120 
					Skill8008.Range[i]    = 15
					--Skill8008.HowLast[i]  = 1000
					
end
					Skill8008.HowLast     = {300000, 600000, 900000}
					Skill8008.Duration    = {60000, 180000, 300000}

Skill8008.TimeUsed = 0; Skill8008.TimeOut = 0; Skill8008.Engaged = false; Skill8008.LastTarget = 0; Skill8008.Reuse = 0; Skills[8008] = Skill8008;
---------------------------------------------------------------------------
-- ========================================================================
--  FILIR
-- ========================================================================
---------------------------------------------------------------------------
Skill8009          = {}; Skill8009.MaxLevel = 5; Skill8009.String = "Pica-Pau";
Skill8009.MinSP = {}; Skill8009.Range = {}; Skill8009.HowLast = {}; Skill8009.Duration = {}; for i = 1, Skill8009.MaxLevel, 1 do 
					Skill8009.MinSP[i]    = 4 * i 
					Skill8009.Range[i]    = 1
					Skill8009.HowLast[i]  = 2000
					Skill8009.Duration[i] = 0
end
Skill8009.TimeUsed = 0; Skill8009.TimeOut = 0; Skill8009.Engaged = false; Skill8009.LastTarget = 0; Skill8009.Reuse = 0; Skills[8009] = Skill8009;
---------------------------------------------------------------------------
Skill8010          = {}; Skill8010.MaxLevel = 5; Skill8010.String = "Vôo Frenético";
Skill8010.MinSP = {}; Skill8010.Range = {}; Skill8010.HowLast = {}; Skill8010.Duration = {}; for i = 1, Skill8010.MaxLevel, 1 do 
					Skill8010.MinSP[i]    = 20 + (i * 10) 
					Skill8010.Range[i]    = 15
					Skill8010.HowLast[i]  = 45000 + (i * 15000)
					Skill8010.Duration[i] = 65000 - (i * 5000)
end
Skill8010.TimeUsed = 0; Skill8010.TimeOut = 0; Skill8010.Engaged = false; Skill8010.LastTarget = 0; Skill8010.Reuse = 0; Skills[8010] = Skill8010;
---------------------------------------------------------------------------
Skill8011          = {}; Skill8011.MaxLevel = 5; Skill8011.String = "Vôo Acelerado";
Skill8011.MinSP = {}; Skill8011.Range = {}; Skill8011.HowLast = {}; Skill8011.Duration = {}; for i = 1, Skill8011.MaxLevel, 1 do 
					Skill8011.MinSP[i]    = 20 + (i * 10) 
					Skill8011.Range[i]    = 15
					Skill8011.HowLast[i]  = 45000 + (i * 15000)
					Skill8011.Duration[i] = 65000 - (i * 5000)
end
Skill8011.TimeUsed = 0; Skill8011.TimeOut = 0; Skill8011.Engaged = false; Skill8011.LastTarget = 0; Skill8011.Reuse = 0; Skills[8011] = Skill8011;
---------------------------------------------------------------------------
-- ========================================================================
--  LIF
-- ========================================================================
---------------------------------------------------------------------------
Skill8001          = {}; Skill8001.MaxLevel = 5; Skill8001.String = "Cura pelas Mãos"
Skill8001.MinSP = {}; Skill8001.Range = {}; Skill8001.HowLast = {}; Skill8001.Duration = {}; for i = 1, Skill8001.MaxLevel, 1 do 
					Skill8001.MinSP[i]    = 10 + (i * 3)
					Skill8001.Range[i]    = 15
					Skill8001.HowLast[i]  = 20000
					Skill8001.Duration[i] = 0
end
Skill8001.TimeUsed = 0; Skill8001.TimeOut = 0; Skill8001.Engaged = false; Skill8001.LastTarget = 0; Skill8001.Reuse = 0; Skills[8001] = Skill8001;
---------------------------------------------------------------------------
Skill8002          = {}; Skill8002.MaxLevel = 5; Skill8002.String = "Bater em Retirada"
Skill8002.MinSP = {}; Skill8002.Range = {}; Skill8002.HowLast = {}; Skill8002.Duration = {}; for i = 1, Skill8002.MaxLevel, 1 do 
					Skill8002.MinSP[i]    = 15 + (i * 5)
					Skill8002.Range[i]    = 15
					Skill8002.HowLast[i]  = 35000
					Skill8002.Duration[i] = 45000 - (i * 5000)
end
Skill8002.TimeUsed = 0; Skill8002.TimeOut = 0; Skill8002.Engaged = false; Skill8002.LastTarget = 0; Skill8002.Reuse = 0; Skills[8002] = Skill8002;
---------------------------------------------------------------------------
Skill8004          = {}; Skill8004.MaxLevel = 3; Skill8004.String = "Esforço Mental"
Skill8004.MinSP = {}; Skill8004.Range = {}; Skill8004.HowLast = {}; Skill8004.Duration = {}; for i = 1, Skill8004.MaxLevel, 1 do 
					Skill8004.MinSP[i]    = 100
					Skill8004.Range[i]    = 15
					Skill8004.HowLast[i]  = 300000 + (i * 300000)
					Skill8004.Duration[i] = 60000 + ((i - 1) * 120000)
end
Skill8004.TimeUsed = 0; Skill8004.TimeOut = 0; Skill8004.Engaged = false; Skill8004.LastTarget = 0; Skill8004.Reuse = 0; Skills[8004] = Skill8004;
---------------------------------------------------------------------------
-- ========================================================================
--  VANILMIRTH
-- ========================================================================
---------------------------------------------------------------------------
Skill8013          = {}; Skill8013.MaxLevel = 5; Skill8013.String = "Capricho"
Skill8013.MinSP = {}; Skill8013.Range = {}; Skill8013.HowLast = {}; Skill8013.Duration = {}; for i = 1, Skill8013.MaxLevel, 1 do 
					Skill8013.MinSP[i]    = 20 + (i * 2)
					Skill8013.Range[i]    = 9
					
					Skill8013.Duration[i] = 0
end
					Skill8013.HowLast     = {2200, 2400, 2600, 2800, 3000}

Skill8013.TimeUsed = 0; Skill8013.TimeOut = 0; Skill8013.Engaged = false; Skill8013.LastTarget = 0; Skill8013.Reuse = 0; Skills[8013] = Skill8013;
---------------------------------------------------------------------------
Skill8014          = {}; Skill8014.MaxLevel = 5; Skill8014.String = "Bênção Caótica"
Skill8014.MinSP = {}; Skill8014.Range = {}; Skill8014.HowLast = {}; Skill8014.Duration = {}; for i = 1, Skill8014.MaxLevel, 1 do 
					Skill8014.MinSP[i]    = 40
					Skill8014.Range[i]    = 15
					Skill8014.HowLast[i]  = 3000
					Skill8014.Duration[i] = 0
end
Skill8014.TimeUsed = 0; Skill8014.TimeOut = 0; Skill8014.Engaged = false; Skill8014.LastTarget = 0; Skill8014.Reuse = 0; Skills[8014] = Skill8014;
---------------------------------------------------------------------------
-- ========================================================================
--  MUTANTES
-- ========================================================================
---------------------------------------------------------------------------
Skill8017          = {}; Skill8017.MaxLevel = 1; Skill8017.String = "MUTATION_BASEJOB (?)"
Skill8017.MinSP = {}; Skill8017.Range = {}; Skill8017.HowLast = {}; Skill8017.Duration = {}; for i = 1, Skill8017.MaxLevel, 1 do 
					Skill8017.MinSP[i]    = 0
					Skill8017.Range[i]    = 0
					Skill8017.HowLast[i]  = 0
					Skill8017.Duration[i] = 0
end
Skill8017.TimeUsed = 0; Skill8017.TimeOut = 0; Skill8017.Engaged = false; Skill8017.LastTarget = 0; Skill8017.Reuse = 0; Skills[8017] = Skill8017;
---------------------------------------------------------------------------
-- ========================================================================
--  SERA
-- ========================================================================
---------------------------------------------------------------------------
Skill8018          = {}; Skill8018.MaxLevel = 5; Skill8018.String = "Convocação"
Skill8018.MinSP = {}; Skill8018.Range = {}; Skill8018.HowLast = {}; Skill8018.Duration = {}; for i = 1, Skill8018.MaxLevel, 1 do 
					Skill8018.MinSP[i]    = 40 + (20 * i)
					Skill8018.Range[i]    = 9
					Skill8018.HowLast[i]  = 1000
					Skill8018.Duration[i] = 10000 + (i * 10000)
end
Skill8018.TimeUsed = 0; Skill8018.TimeOut = 0; Skill8018.Engaged = false; Skill8018.LastTarget = 0; Skill8018.Reuse = 0; Skills[8018] = Skill8018;
---------------------------------------------------------------------------
Skill8019          = {}; Skill8019.MaxLevel = 5; Skill8019.String = "Ponto de Paralisia"
Skill8019.MinSP = {}; Skill8019.Range = {}; Skill8019.HowLast = {}; Skill8019.Duration = {}; for i = 1, Skill8019.MaxLevel, 1 do 
					Skill8019.MinSP[i]    = 36 + (12 * i)
					Skill8019.Range[i]    = 5
					Skill8019.HowLast[i]  = 2000
					Skill8019.Duration[i] = 0
end
Skill8019.TimeUsed = 0; Skill8019.TimeOut = 0; Skill8019.Engaged = false; Skill8019.LastTarget = 0; Skill8019.Reuse = 0; Skills[8019] = Skill8019;
---------------------------------------------------------------------------
Skill8020          = {}; Skill8020.MaxLevel = 5; Skill8020.String = "Névoa Venenosa"
Skill8020.MinSP = {}; Skill8020.Range = {}; Skill8020.HowLast = {}; Skill8020.Duration = {}; for i = 1, Skill8020.MaxLevel, 1 do 
					Skill8020.MinSP[i]    = 55 + (10 * i)
					Skill8020.Range[i]    = 5
					Skill8020.HowLast[i]  = 10000 + (2000 * i)
					Skill8020.Duration[i] = 10000 + (2000 * i)
end
Skill8020.TimeUsed = 0; Skill8020.TimeOut = 0; Skill8020.Engaged = false; Skill8020.LastTarget = 0; Skill8020.Reuse = 0; Skills[8020] = Skill8020;
---------------------------------------------------------------------------
Skill8021          = {}; Skill8021.MaxLevel = 5; Skill8021.String = "Analgésico"
Skill8021.MinSP = {}; Skill8021.Range = {}; Skill8021.HowLast = {}; Skill8021.Duration = {}; for i = 1, Skill8021.MaxLevel, 1 do 
					Skill8021.MinSP[i]    = 44 + (4 * i)
					Skill8021.Range[i]    = 1
					Skill8021.HowLast[i]  = 1000
					--  Diminuir um pouco para reutilizar antes que acabe
					Skill8021.Duration[i] = (10000 + (10000 * i)) - 3000
end
Skill8021.TimeUsed = 0; Skill8021.TimeOut = 0; Skill8021.Engaged = false; Skill8021.LastTarget = 0; Skill8021.Reuse = 0; Skills[8021] = Skill8021;
---------------------------------------------------------------------------
-- ========================================================================
--  EIRA
-- ========================================================================
---------------------------------------------------------------------------
Skill8022          = {}; Skill8022.MaxLevel = 5; Skill8022.String = "Luz da Criação"
Skill8022.MinSP = {}; Skill8022.Range = {}; Skill8022.HowLast = {}; Skill8022.Duration = {}; for i = 1, Skill8022.MaxLevel, 1 do 
					
					Skill8022.Range[i]    = 15
					Skill8022.HowLast[i]  = 1000
					Skill8022.Duration[i] = 300000 + (60000 * i)
end
					Skill8022.MinSP       = {50, 50, 60, 70, 80}

Skill8022.TimeUsed = 0; Skill8022.TimeOut = 0; Skill8022.Engaged = false; Skill8022.LastTarget = 0; Skill8022.Reuse = 0; Skills[8022] = Skill8022;
---------------------------------------------------------------------------
Skill8023          = {}; Skill8023.MaxLevel = 5; Skill8023.String = "Esquiva Especial"
Skill8023.MinSP = {}; Skill8023.Range = {}; Skill8023.HowLast = {}; Skill8023.Duration = {}; for i = 1, Skill8023.MaxLevel, 1 do 
					Skill8023.MinSP[i]    = 50 + (i * 20)
					Skill8023.Range[i]    = 15
					Skill8023.HowLast[i]  = 1000
					--  Diminuir um pouco para reutilizar antes que acabe
					Skill8023.Duration[i] = (15000 + (i * 15000)) - 2000
end
Skill8023.TimeUsed = 0; Skill8023.TimeOut = 0; Skill8023.Engaged = false; Skill8023.LastTarget = 0; Skill8023.Reuse = 0; Skills[8023] = Skill8023;
---------------------------------------------------------------------------
Skill8024          = {}; Skill8024.MaxLevel = 5; Skill8024.String = "Choque Supersônico"
Skill8024.MinSP = {}; Skill8024.Range = {}; Skill8024.HowLast = {}; Skill8024.Duration = {}; for i = 1, Skill8024.MaxLevel, 1 do 
					Skill8024.MinSP[i]    = 20 + (5 * i)
					Skill8024.Range[i]    = 7
					Skill8024.HowLast[i]  = 2000
					Skill8024.Duration[i] = 0
end
Skill8024.TimeUsed = 0; Skill8024.TimeOut = 0; Skill8024.Engaged = false; Skill8024.LastTarget = 0; Skill8024.Reuse = 0; Skills[8024] = Skill8024;
---------------------------------------------------------------------------
Skill8025          = {}; Skill8025.MaxLevel = 5; Skill8025.String = "Onda Supersônica"
Skill8025.MinSP = {}; Skill8025.Range = {}; Skill8025.HowLast = {}; Skill8025.Duration = {}; for i = 1, Skill8025.MaxLevel, 1 do 
					Skill8025.MinSP[i]    = 80 + (i * 10)
					Skill8025.Range[i]    = 7
					Skill8025.HowLast[i]  = 5000
					Skill8025.Duration[i] = 0
end
Skill8025.TimeUsed = 0; Skill8025.TimeOut = 0; Skill8025.Engaged = false; Skill8025.LastTarget = 0; Skill8025.Reuse = 0; Skills[8025] = Skill8025;
---------------------------------------------------------------------------
Skill8026          = {}; Skill8026.MaxLevel = 5; Skill8026.String = "Brisa da Calmaria"
Skill8026.MinSP = {}; Skill8026.Range = {}; Skill8026.HowLast = {}; Skill8026.Duration = {}; for i = 1, Skill8026.MaxLevel, 1 do 
					Skill8026.MinSP[i]    = 36 + (9 * i)
					
					Skill8026.HowLast[i]  = 1000
					--  Diminuir um pouco para reutilizar antes que acabe
					Skill8026.Duration[i] = (6000 + (i * 3000)) - 3000
end
					Skill8026.Range       = {5, 5, 7, 7, 9}

Skill8026.TimeUsed = 0; Skill8026.TimeOut = 0; Skill8026.Engaged = false; Skill8026.LastTarget = 0; Skill8026.Reuse = 0; Skills[8026] = Skill8026;
---------------------------------------------------------------------------
-- ========================================================================
--  ELEANOR
-- ========================================================================
---------------------------------------------------------------------------
Skill8027          = {}; Skill8027.MaxLevel = 5; Skill8027.String = "Estilo de Luta"
Skill8027.MinSP = {}; Skill8027.Range = {}; Skill8027.HowLast = {}; Skill8027.Duration = {}; for i = 1, Skill8027.MaxLevel, 1 do 
					Skill8027.MinSP[i]    = 35
					Skill8027.Range[i]    = 15
					Skill8027.HowLast[i]  = 1000
					Skill8027.Duration[i] = 0
end
Skill8027.TimeUsed = 0; Skill8027.TimeOut = 0; Skill8027.Engaged = false; Skill8027.LastTarget = 0; Skill8027.Reuse = 0; Skills[8027] = Skill8027;
---------------------------------------------------------------------------
Skill8028          = {}; Skill8028.MaxLevel = 5; Skill8028.String = "Garra Supersônica"
Skill8028.MinSP = {}; Skill8028.Range = {}; Skill8028.HowLast = {}; Skill8028.Duration = {}; for i = 1, Skill8028.MaxLevel, 1 do 
					Skill8028.MinSP[i]    = 15 + (5 * i)
					Skill8028.Range[i]    = 1
					Skill8028.HowLast[i]  = 1000
					Skill8028.Duration[i] = 0
end
Skill8028.TimeUsed = 0; Skill8028.TimeOut = 0; Skill8028.Engaged = false; Skill8028.LastTarget = 0; Skill8028.Reuse = 0; Skills[8028] = Skill8028;
---------------------------------------------------------------------------
Skill8029          = {}; Skill8029.MaxLevel = 5; Skill8029.String = "Rastro Brilhante"
Skill8029.MinSP = {}; Skill8029.Range = {}; Skill8029.HowLast = {}; Skill8029.Duration = {}; for i = 1, Skill8029.MaxLevel, 1 do 
					Skill8029.MinSP[i]    = 5 + (5 * i)
					Skill8029.Range[i]    = 1
					Skill8029.HowLast[i]  = 1000
					Skill8029.Duration[i] = 0
end
Skill8029.TimeUsed = 0; Skill8029.TimeOut = 0; Skill8029.Engaged = false; Skill8029.LastTarget = 0; Skill8029.Reuse = 0; Skills[8029] = Skill8029;
---------------------------------------------------------------------------
Skill8030          = {}; Skill8030.MaxLevel = 5; Skill8030.String = "Delírio Noturno"
Skill8030.MinSP = {}; Skill8030.Range = {}; Skill8030.HowLast = {}; Skill8030.Duration = {}; for i = 1, Skill8030.MaxLevel, 1 do 
					Skill8030.MinSP[i]    = 8 * i
					Skill8030.Range[i]    = 1
					Skill8030.HowLast[i]  = 1000
					Skill8030.Duration[i] = 0
end
Skill8030.TimeUsed = 0; Skill8030.TimeOut = 0; Skill8030.Engaged = false; Skill8030.LastTarget = 0; Skill8030.Reuse = 0; Skills[8030] = Skill8030;
---------------------------------------------------------------------------
Skill8036          = {}; Skill8036.MaxLevel = 5; Skill8036.String = "Quebra-Costelas"
Skill8036.MinSP = {}; Skill8036.Range = {}; Skill8036.HowLast = {}; Skill8036.Duration = {}; for i = 1, Skill8036.MaxLevel, 1 do 
					Skill8036.MinSP[i]    = 15 + (5 * i)
					Skill8036.Range[i]    = 2 + (i)
					Skill8036.HowLast[i]  = 1000
					Skill8036.Duration[i] = 0
end
Skill8036.TimeUsed = 0; Skill8036.TimeOut = 0; Skill8036.Engaged = false; Skill8036.LastTarget = 0; Skill8036.Reuse = 0; Skills[8036] = Skill8036;
---------------------------------------------------------------------------
Skill8037          = {}; Skill8037.MaxLevel = 5; Skill8037.String = "Dreno Traumático"
Skill8037.MinSP = {}; Skill8037.Range = {}; Skill8037.HowLast = {}; Skill8037.Duration = {}; for i = 1, Skill8037.MaxLevel, 1 do 
					Skill8037.MinSP[i]    = 10 * i
					Skill8037.Range[i]    = 1
					Skill8037.HowLast[i]  = 1000
					Skill8037.Duration[i] = 0
end
Skill8037.TimeUsed = 0; Skill8037.TimeOut = 0; Skill8037.Engaged = false; Skill8037.LastTarget = 0; Skill8037.Reuse = 0; Skills[8037] = Skill8037;
---------------------------------------------------------------------------
Skill8038          = {}; Skill8038.MaxLevel = 5; Skill8038.String = "Estado Traumático"
Skill8038.MinSP = {}; Skill8038.Range = {}; Skill8038.HowLast = {}; Skill8038.Duration = {}; for i = 1, Skill8038.MaxLevel, 1 do 
					Skill8038.MinSP[i]    = 20 + (4 * i)
					Skill8038.Range[i]    = 1
					Skill8038.HowLast[i]  = 1000
					Skill8038.Duration[i] = 0
end
Skill8038.TimeUsed = 0; Skill8038.TimeOut = 0; Skill8038.Engaged = false; Skill8038.LastTarget = 0; Skill8038.Reuse = 0; Skills[8038] = Skill8038;
---------------------------------------------------------------------------
-- ========================================================================
--  BAYERI
-- ========================================================================
---------------------------------------------------------------------------
Skill8031          = {}; Skill8031.MaxLevel = 5; Skill8031.String = "Impacto Preciso"
Skill8031.MinSP = {}; Skill8031.Range = {}; Skill8031.HowLast = {}; Skill8031.Duration = {}; for i = 1, Skill8031.MaxLevel, 1 do 
					Skill8031.MinSP[i]    = 35 + (5 * i)
					Skill8031.Range[i]    = 4 + i
					Skill8031.HowLast[i]  = 3000
					Skill8031.Duration[i] = 0
end
Skill8031.TimeUsed = 0; Skill8031.TimeOut = 0; Skill8031.Engaged = false; Skill8031.LastTarget = 0; Skill8031.Reuse = 0; Skills[8031] = Skill8031;
---------------------------------------------------------------------------
Skill8032          = {}; Skill8032.MaxLevel = 5; Skill8032.String = "Fúria Iluminada"
Skill8032.MinSP = {}; Skill8032.Range = {}; Skill8032.HowLast = {}; Skill8032.Duration = {}; for i = 1, Skill8032.MaxLevel, 1 do 
					Skill8032.MinSP[i]    = 55 + (5 * i)
					Skill8032.Range[i]    = 15
					Skill8032.HowLast[i]  = 1000
					Skill8032.Duration[i] = 15000 + (i * 15000)
end
Skill8032.TimeUsed = 0; Skill8032.TimeOut = 0; Skill8032.Engaged = false; Skill8032.LastTarget = 0; Skill8032.Reuse = 0; Skills[8032] = Skill8032;
---------------------------------------------------------------------------
Skill8033          = {}; Skill8033.MaxLevel = 5; Skill8033.String = "Luz Salvadora"
Skill8033.MinSP = {}; Skill8033.Range = {}; Skill8033.HowLast = {}; Skill8033.Duration = {}; for i = 1, Skill8033.MaxLevel, 1 do 
					Skill8033.MinSP[i]    = 70 + (10 * i)
					Skill8033.Range[i]    = 15
					Skill8033.HowLast[i]  = 1000
					Skill8033.Duration[i] = 15000 + (i * 15000)
end
Skill8033.TimeUsed = 0; Skill8033.TimeOut = 0; Skill8033.Engaged = false; Skill8033.LastTarget = 0; Skill8033.Reuse = 0; Skills[8033] = Skill8033;
---------------------------------------------------------------------------
Skill8034          = {}; Skill8034.MaxLevel = 5; Skill8034.String = "Illuminatus"
Skill8034.MinSP = {}; Skill8034.Range = {}; Skill8034.HowLast = {}; Skill8034.Duration = {}; for i = 1, Skill8034.MaxLevel, 1 do 
					Skill8034.MinSP[i]    = 52 + (8 * i)
					Skill8034.Range[i]    = 9
					Skill8034.HowLast[i]  = 5000
					Skill8034.Duration[i] = 0
end
Skill8034.TimeUsed = 0; Skill8034.TimeOut = 0; Skill8034.Engaged = false; Skill8034.LastTarget = 0; Skill8034.Reuse = 0; Skills[8034] = Skill8034;
---------------------------------------------------------------------------
Skill8035          = {}; Skill8035.MaxLevel = 5; Skill8035.String = "Raiva Iluminada"
Skill8035.MinSP = {}; Skill8035.Range = {}; Skill8035.HowLast = {}; Skill8035.Duration = {}; for i = 1, Skill8035.MaxLevel, 1 do 
					Skill8035.MinSP[i]    = 55 + (5 * i)
					Skill8035.Range[i]    = 15
					Skill8035.HowLast[i]  = 1000
					Skill8035.Duration[i] = 15000 + (i * 15000)
end
Skill8035.TimeUsed = 0; Skill8035.TimeOut = 0; Skill8035.Engaged = false; Skill8035.LastTarget = 0; Skill8035.Reuse = 0; Skills[8035] = Skill8035;
---------------------------------------------------------------------------
-- ========================================================================
--  DIETER
-- ========================================================================
---------------------------------------------------------------------------
Skill8039          = {}; Skill8039.MaxLevel = 5; Skill8039.String = "Inundação de Magma"
Skill8039.MinSP = {}; Skill8039.Range = {}; Skill8039.HowLast = {}; Skill8039.Duration = {}; for i = 1, Skill8039.MaxLevel, 1 do 
					Skill8039.MinSP[i]    = 30 + (4 * i)
					Skill8039.Range[i]    = 15
					Skill8039.HowLast[i]  = 1000
					Skill8039.Duration[i] = 15000 + (i * 15000)
end
Skill8039.TimeUsed = 0; Skill8039.TimeOut = 0; Skill8039.Engaged = false; Skill8039.LastTarget = 0; Skill8039.Reuse = 0; Skills[8039] = Skill8039;
---------------------------------------------------------------------------
Skill8040          = {}; Skill8040.MaxLevel = 5; Skill8040.String = "Armadura de Granito"
Skill8040.MinSP = {}; Skill8040.Range = {}; Skill8040.HowLast = {}; Skill8040.Duration = {}; for i = 1, Skill8040.MaxLevel, 1 do 
					Skill8040.MinSP[i]    = 50 + (4 * i)
					Skill8040.Range[i]    = 15
					Skill8040.HowLast[i]  = 1000
					Skill8040.Duration[i] = 60000
end
Skill8040.TimeUsed = 0; Skill8040.TimeOut = 0; Skill8040.Engaged = false; Skill8040.LastTarget = 0; Skill8040.Reuse = 0; Skills[8040] = Skill8040;
---------------------------------------------------------------------------
Skill8041          = {}; Skill8041.MaxLevel = 5; Skill8041.String = "Derretimento com Lava"
Skill8041.MinSP = {}; Skill8041.Range = {}; Skill8041.HowLast = {}; Skill8041.Duration = {}; for i = 1, Skill8041.MaxLevel, 1 do 
					Skill8041.MinSP[i]    = 25 + (5 * i)
					Skill8041.Range[i]    = 5
					Skill8041.HowLast[i]  = 1000
					Skill8041.Duration[i] = 10000 + (i * 2000)
end
Skill8041.TimeUsed = 0; Skill8041.TimeOut = 0; Skill8041.Engaged = false; Skill8041.LastTarget = 0; Skill8041.Reuse = 0; Skills[8041] = Skill8041;
---------------------------------------------------------------------------
Skill8042          = {}; Skill8042.MaxLevel = 5; Skill8042.String = "Tremor de Fogo"
Skill8042.MinSP = {}; Skill8042.Range = {}; Skill8042.HowLast = {}; Skill8042.Duration = {}; for i = 1, Skill8042.MaxLevel, 1 do 
					Skill8042.MinSP[i]    = 12 + (8 * i)
					Skill8042.Range[i]    = 15
					Skill8042.HowLast[i]  = 1000
					Skill8042.Duration[i] = 30000 + (30000 * i)
end
Skill8042.TimeUsed = 0; Skill8042.TimeOut = 0; Skill8042.Engaged = false; Skill8042.LastTarget = 0; Skill8042.Reuse = 0; Skills[8042] = Skill8042;
---------------------------------------------------------------------------
Skill8043          = {}; Skill8043.MaxLevel = 5; Skill8043.String = "Cinzas Vulcânicas"
Skill8043.MinSP = {}; Skill8043.Range = {}; Skill8043.HowLast = {}; Skill8043.Duration = {}; for i = 1, Skill8043.MaxLevel, 1 do 
					Skill8043.MinSP[i]    = 55 + (5 * i)
					Skill8043.Range[i]    = 7
					Skill8043.HowLast[i]  = 1000
					Skill8043.Duration[i] = 10000 + (2000 * i)
end
Skill8043.TimeUsed = 0; Skill8043.TimeOut = 0; Skill8043.Engaged = false; Skill8043.LastTarget = 0; Skill8043.Reuse = 0; Skills[8043] = Skill8043;
---------------------------------------------------------------------------
-- ========================================================================
--  SKILLS DE ASSISTENTE
-- ========================================================================
---------------------------------------------------------------------------
-- ========================================================================
--  RAPIDEZ COM ARMA
-- ========================================================================
---------------------------------------------------------------------------
Skill8223          = {}; Skill8223.MaxLevel = 10; Skill8223.String = "Rapidez com Arma"
Skill8223.MinSP = {}; Skill8223.Range = {}; Skill8223.HowLast = {}; Skill8223.Duration = {}; for i = 1, Skill8223.MaxLevel, 1 do 
					Skill8223.MinSP[i]    = 10 + (4 * i)
					Skill8223.Range[i]    = 15
					Skill8223.HowLast[i]  = 1000
					Skill8223.Duration[i] = (i * 30) * 1000
end
Skill8223.TimeUsed = 0; Skill8223.TimeOut = 0; Skill8223.Engaged = false; Skill8223.LastTarget = 0; Skill8223.Reuse = 0; Skills[8223] = Skill8223;
---------------------------------------------------------------------------
-- ========================================================================
--  RAJADA DE FLECHAS
-- ========================================================================
---------------------------------------------------------------------------
Skill8207          = {}; Skill8207.MaxLevel = 10; Skill8207.String = "Rajada de Flechas"
Skill8207.MinSP = {}; Skill8207.Range = {}; Skill8207.HowLast = {}; Skill8207.Duration = {}; for i = 1, Skill8207.MaxLevel, 1 do 
					Skill8207.MinSP[i]    = 12
					Skill8207.Range[i]    = 10
					Skill8207.HowLast[i]  = 1000
					Skill8207.Duration[i] = 0
end
Skill8207.TimeUsed = 0; Skill8207.TimeOut = 0; Skill8207.Engaged = false; Skill8207.LastTarget = 0; Skill8207.Reuse = 0; Skills[8207] = Skill8207;
---------------------------------------------------------------------------
-- ========================================================================
--  GOLPE FULMINANTE
-- ========================================================================
---------------------------------------------------------------------------
Skill8201          = {}; Skill8201.MaxLevel = 10; Skill8201.String = "Golpe Fulminante"
Skill8201.MinSP = {}; Skill8201.Range = {}; Skill8201.HowLast = {}; Skill8201.Duration = {}; for i = 1, Skill8201.MaxLevel, 1 do 
					
					Skill8201.Range[i]    = 2
					Skill8201.HowLast[i]  = 880
					Skill8201.Duration[i] = 0
end
					Skill8201.MinSP       = {8, 8, 8, 8, 8, 15, 15, 15, 15, 15}
Skill8201.TimeUsed = 0; Skill8201.TimeOut = 0; Skill8201.Engaged = false; Skill8201.LastTarget = 0; Skill8201.Reuse = 0; Skills[8201] = Skill8201;
---------------------------------------------------------------------------
-- ========================================================================
--  CHUVA DE FLECHAS
-- ========================================================================
---------------------------------------------------------------------------
Skill8208          = {}; Skill8208.MaxLevel = 10; Skill8208.String = "Chuva de Flechas"
Skill8208.MinSP = {}; Skill8208.Range = {}; Skill8208.HowLast = {}; Skill8208.Duration = {}; for i = 1, Skill8208.MaxLevel, 1 do 
					Skill8208.MinSP[i]    = 15
					Skill8208.Range[i]    = 10
					Skill8208.HowLast[i]  = 1000
					Skill8208.Duration[i] = 0
end
Skill8208.TimeUsed = 0; Skill8208.TimeOut = 0; Skill8208.Engaged = false; Skill8208.LastTarget = 0; Skill8208.Reuse = 0; Skills[8208] = Skill8208;
---------------------------------------------------------------------------
-- ========================================================================
--  DISPARO VIOLENTO
-- ========================================================================
---------------------------------------------------------------------------
Skill8214          = {}; Skill8214.MaxLevel = 1; Skill8214.String = "Disparo Violento"
Skill8214.MinSP = {}; Skill8214.Range = {}; Skill8214.HowLast = {}; Skill8214.Duration = {}; for i = 1, Skill8214.MaxLevel, 1 do 
					Skill8214.MinSP[i]    = 15
					Skill8214.Range[i]    = 10
					Skill8214.HowLast[i]  = 1500
					Skill8214.Duration[i] = 0
end
Skill8214.TimeUsed = 0; Skill8214.TimeOut = 0; Skill8214.Engaged = false; Skill8214.LastTarget = 0; Skill8214.Reuse = 0; Skills[8214] = Skill8214;
---------------------------------------------------------------------------
-- ========================================================================
--  CHAMA REVELADORA
-- ========================================================================
---------------------------------------------------------------------------
Skill8224          = {}; Skill8224.MaxLevel = 1; Skill8224.String = "Chama Reveladora"
Skill8224.MinSP = {}; Skill8224.Range = {}; Skill8224.HowLast = {}; Skill8224.Duration = {}; for i = 1, Skill8224.MaxLevel, 1 do 
					Skill8224.MinSP[i]    = 20
					Skill8224.Range[i]    = 15
					Skill8224.HowLast[i]  = 1000
					Skill8224.Duration[i] = 30000
end
Skill8224.TimeUsed = 0; Skill8224.TimeOut = 0; Skill8224.Engaged = false; Skill8224.LastTarget = 0; Skill8224.Reuse = 0; Skills[8224] = Skill8224;
---------------------------------------------------------------------------
-- ========================================================================
--  MAGNIFICAT
-- ========================================================================
---------------------------------------------------------------------------
Skill8222          = {}; Skill8222.MaxLevel = 5; Skill8222.String = "Magnificat"
Skill8222.MinSP = {}; Skill8222.Range = {}; Skill8222.HowLast = {}; Skill8222.Duration = {}; for i = 1, Skill8222.MaxLevel, 1 do 
					Skill8222.MinSP[i]    = 40
					Skill8222.Range[i]    = 15
					Skill8222.HowLast[i]  = 1000
					Skill8222.Duration[i] = (15000 + (i * 15000))
end
Skill8222.TimeUsed = 0; Skill8222.TimeOut = 0; Skill8222.Engaged = false; Skill8222.LastTarget = 0; Skill8222.Reuse = 0; Skills[8222] = Skill8222;
---------------------------------------------------------------------------
-- ========================================================================
--  PROVOCAR
-- ========================================================================
---------------------------------------------------------------------------
Skill8232          = {}; Skill8232.MaxLevel = 10; Skill8232.String = "Provocar"
Skill8232.MinSP = {}; Skill8232.Range = {}; Skill8232.HowLast = {}; Skill8232.Duration = {}; for i = 1, Skill8232.MaxLevel, 1 do 
					Skill8232.MinSP[i]    = 3 + (i * 1)
					Skill8232.Range[i]    = 9
					Skill8232.HowLast[i]  = 880
					Skill8232.Duration[i] = 30000
end
Skill8232.TimeUsed = 0; Skill8232.TimeOut = 0; Skill8232.Engaged = false; Skill8232.LastTarget = 0; Skill8232.Reuse = 0; Skills[8232] = Skill8232;
---------------------------------------------------------------------------
-- ========================================================================
--  DIMINUIR AGILIDADE
-- ========================================================================
---------------------------------------------------------------------------
Skill8234          = {}; Skill8234.MaxLevel = 10; Skill8234.String = "Diminuir Agilidade"
Skill8234.MinSP = {}; Skill8234.Range = {}; Skill8234.HowLast = {}; Skill8234.Duration = {}; for i = 1, Skill8234.MaxLevel, 1 do 
					Skill8234.MinSP[i]    = 3 + (i * 1)
					Skill8234.Range[i]    = 9
					Skill8234.HowLast[i]  = 2000
					Skill8234.Duration[i] = 20000 + (i * 10000) 
end
Skill8234.TimeUsed = 0; Skill8234.TimeOut = 0; Skill8234.Engaged = false; Skill8234.LastTarget = 0; Skill8234.Reuse = 0; Skills[8234] = Skill8234;
---------------------------------------------------------------------------
-- ========================================================================
--  TIRO PRECISO
-- ========================================================================
---------------------------------------------------------------------------
Skill8215          = {}; Skill8215.MaxLevel = 5; Skill8215.String = "Tiro Preciso"
Skill8215.MinSP = {}; Skill8215.Range = {}; Skill8215.HowLast = {}; Skill8215.Duration = {}; for i = 1, Skill8215.MaxLevel, 1 do 
					Skill8215.MinSP[i]    = 15 + (i * 3)
					Skill8215.Range[i]    = 9
					Skill8215.HowLast[i]  = 2000
					Skill8215.Duration[i] = 0
end
Skill8215.TimeUsed = 0; Skill8215.TimeOut = 0; Skill8215.Engaged = false; Skill8215.LastTarget = 0; Skill8215.Reuse = 0; Skills[8215] = Skill8215;
---------------------------------------------------------------------------
-- ========================================================================
--  PERFURAR
-- ========================================================================
---------------------------------------------------------------------------
Skill8216          = {}; Skill8216.MaxLevel = 10; Skill8216.String = "Perfurar"
Skill8216.MinSP = {}; Skill8216.Range = {}; Skill8216.HowLast = {}; Skill8216.Duration = {}; for i = 1, Skill8216.MaxLevel, 1 do 
					Skill8216.MinSP[i]    = 7
					Skill8216.Range[i]    = 3
					Skill8216.HowLast[i]  = 880
					Skill8216.Duration[i] = 0
end
Skill8216.TimeUsed = 0; Skill8216.TimeOut = 0; Skill8216.Engaged = false; Skill8216.LastTarget = 0; Skill8216.Reuse = 0; Skills[8216] = Skill8216;
---------------------------------------------------------------------------
-- ========================================================================
--  BRANDIR LANÇA
-- ========================================================================
---------------------------------------------------------------------------
Skill8217          = {}; Skill8217.MaxLevel = 10; Skill8217.String = "Brandir Lança"
Skill8217.MinSP = {}; Skill8217.Range = {}; Skill8217.HowLast = {}; Skill8217.Duration = {}; for i = 1, Skill8217.MaxLevel, 1 do 
					Skill8217.MinSP[i]    = 12
					Skill8217.Range[i]    = 2
					Skill8217.HowLast[i]  = 880
					Skill8217.Duration[i] = 0
end
Skill8217.TimeUsed = 0; Skill8217.TimeOut = 0; Skill8217.Engaged = false; Skill8217.LastTarget = 0; Skill8217.Reuse = 0; Skills[8217] = Skill8217;
---------------------------------------------------------------------------
-- ========================================================================
--  BLOQUEIO
-- ========================================================================
---------------------------------------------------------------------------
Skill8220          = {}; Skill8220.MaxLevel = 10; Skill8220.String = "Bloqueio"
Skill8220.MinSP = {}; Skill8220.Range = {}; Skill8220.HowLast = {}; Skill8220.Duration = {}; for i = 1, Skill8220.MaxLevel, 1 do 
					Skill8220.MinSP[i]    = 10 + (i * 2)
					Skill8220.Range[i]    = 15
					Skill8220.HowLast[i]  = 880
					Skill8220.Duration[i] = 300200
end
Skill8220.TimeUsed = 0; Skill8220.TimeOut = 0; Skill8220.Engaged = false; Skill8220.LastTarget = 0; Skill8220.Reuse = 0; Skills[8220] = Skill8220;
---------------------------------------------------------------------------
-- ========================================================================
--  CRASH (IMPACTO)
-- ========================================================================
---------------------------------------------------------------------------
Skill8225          = {}; Skill8225.MaxLevel = 10; Skill8225.String = "Impacto"
Skill8225.MinSP = {}; Skill8225.Range = {}; Skill8225.HowLast = {}; Skill8225.Duration = {}; for i = 1, Skill8225.MaxLevel, 1 do 
					Skill8225.MinSP[i]    = 10
					Skill8225.Range[i]    = 2
					Skill8225.HowLast[i]  = 1000
					Skill8225.Duration[i] = 0
end
Skill8225.TimeUsed = 0; Skill8225.TimeOut = 0; Skill8225.Engaged = false; Skill8225.LastTarget = 0; Skill8225.Reuse = 0; Skills[8225] = Skill8225;
---------------------------------------------------------------------------
-- ========================================================================
--  PERFURAR EM ESPIRAL
-- ========================================================================
---------------------------------------------------------------------------
Skill8218          = {}; Skill8218.MaxLevel = 5; Skill8218.String = "Perfurar em Espiral"
Skill8218.MinSP = {}; Skill8218.Range = {}; Skill8218.HowLast = {}; Skill8218.Duration = {}; for i = 1, Skill8218.MaxLevel, 1 do 
					Skill8218.MinSP[i]    = 15 + (i * 3)
					Skill8218.Range[i]    = 5
					Skill8218.HowLast[i]  = 1000 + (i * 200)
					Skill8218.Duration[i] = 0
end
Skill8218.TimeUsed = 0; Skill8218.TimeOut = 0; Skill8218.Engaged = false; Skill8218.LastTarget = 0; Skill8218.Reuse = 0; Skills[8218] = Skill8218;
---------------------------------------------------------------------------
-- ========================================================================
--  IMPACTO EXPLOSIVO
-- ========================================================================
---------------------------------------------------------------------------
Skill8202          = {}; Skill8202.MaxLevel = 10; Skill8202.String = "Impacto Explosivo"
Skill8202.MinSP = {}; Skill8202.Range = {}; Skill8202.HowLast = {}; Skill8202.Duration = {}; for i = 1, Skill8202.MaxLevel, 1 do 
					Skill8202.MinSP[i]    = 30
					Skill8202.Range[i]    = 4
					Skill8202.HowLast[i]  = 2000
					Skill8202.Duration[i] = 0
end
Skill8202.TimeUsed = 0; Skill8202.TimeOut = 0; Skill8202.Engaged = false; Skill8202.LastTarget = 0; Skill8202.Reuse = 0; Skills[8202] = Skill8202;
---------------------------------------------------------------------------
-- ========================================================================
--  IMPACTO DE TYR
-- ========================================================================
---------------------------------------------------------------------------
Skill8203          = {}; Skill8203.MaxLevel = 10; Skill8203.String = "Impacto de Tyr"
Skill8203.MinSP = {}; Skill8203.Range = {}; Skill8203.HowLast = {}; Skill8203.Duration = {}; for i = 1, Skill8203.MaxLevel, 1 do 
					Skill8203.MinSP[i]    = 12 + i
					Skill8203.Range[i]    = 2
					Skill8203.HowLast[i]  = 2000
					Skill8203.Duration[i] = 0
end
Skill8203.TimeUsed = 0; Skill8203.TimeOut = 0; Skill8203.Engaged = false; Skill8203.LastTarget = 0; Skill8203.Reuse = 0; Skills[8203] = Skill8203;
---------------------------------------------------------------------------
-- ========================================================================
--  APARAR GOLPE
-- ========================================================================
---------------------------------------------------------------------------
Skill8204          = {}; Skill8204.MaxLevel = 10; Skill8204.String = "Aparar Golpe"
Skill8204.MinSP = {}; Skill8204.Range = {}; Skill8204.HowLast = {}; Skill8204.Duration = {}; for i = 1, Skill8204.MaxLevel, 1 do 
					Skill8204.MinSP[i]    = 50
					Skill8204.Range[i]    = 15
					Skill8204.HowLast[i]  = 10000 + (i * 5000)
					Skill8204.Duration[i] = 0
end
Skill8204.TimeUsed = 0; Skill8204.TimeOut = 0; Skill8204.Engaged = false; Skill8204.LastTarget = 0; Skill8204.Reuse = 0; Skills[8204] = Skill8204;
---------------------------------------------------------------------------
-- ========================================================================
--  ESCUDO REFLETOR
-- ========================================================================
---------------------------------------------------------------------------
Skill8205          = {}; Skill8205.MaxLevel = 10; Skill8205.String = "Escudo Refletor"
Skill8205.MinSP = {}; Skill8205.Range = {}; Skill8205.HowLast = {}; Skill8205.Duration = {}; for i = 1, Skill8205.MaxLevel, 1 do 
					Skill8205.MinSP[i]    = 30 + (i * 5)
					Skill8205.Range[i]    = 15
					Skill8205.HowLast[i]  = 300200
					Skill8205.Duration[i] = 0
end
Skill8205.TimeUsed = 0; Skill8205.TimeOut = 0; Skill8205.Engaged = false; Skill8205.LastTarget = 0; Skill8205.Reuse = 0; Skills[8205] = Skill8205;
---------------------------------------------------------------------------
-- ========================================================================
--  PREPARAR HABILIDADES
-- ========================================================================
---------------------------------------------------------------------------
function GetAvailableSkills(aiType) --  Cria uma lista de habilidades disponíveis e seus níveis para assistentes ou homunculus. Depois, conta o total delas.
--------------------------------------------------------------------------- 
	local slot = 1;
	
	--  Homunculus.
	if aiType == 1 and Homun then
		
		--  Novo: configurado por ordem de importância.
		--  Para homunculi S, adicione as habilidades de homunculus inicial. Só as de cooldown baixo estão programadas.
		
		--  GARRA SUPERSÔNICA
		--  RASTRO BRILHANTE
		--  DELÍRIO NOTURNO
		if Homun == ELEANOR 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8028; Available[slot]["Level"] = 5;  slot = slot + 1;
			Available[slot] = {}; Available[slot]["Skill"] = 8029; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8030; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  QUEBRA-COSTELAS
		--  DRENO TRAUMÁTICO
		--  ESTADO TRAUMÁTICO
		if Homun == ELEANOR 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8036; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8037; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8038; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  ESQUIVA ESPECIAL
		if Homun == EIRA 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8023; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  ANALGÉSICO
		if Homun == SERA 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8021; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  INUNDAÇÃO DE MAGMA
		--  TREMOR DE FOGO
		--  ARMADURA DE GRANITO
		if Homun == DIETER
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8039; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8042; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8040; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
			
		--  FÚRIA ILUMINADA
		--  RAIVA ILUMINADA
		if Homun == BAYERI 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8032; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8035; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  PICA-PAU
		if Homun == FILIR or Homun == FILIR_H or Homun == FILIR2 or Homun == FILIR_H2
		or Homun == ELEANOR 
		or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8009; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  ONDA SUPERSÔNICA
		if Homun == EIRA 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8025; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  CHOQUE SUPERSÔNICO
		if Homun == EIRA 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8024; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  BRISA DA CALMARIA
		if Homun == EIRA 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8026; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  CONVOCAÇÃO
		if Homun == SERA 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8018; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  NÉVOA VENENOSA
		if Homun == SERA 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8020; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  PONTO DA PARALISIA
		if Homun == SERA 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8019; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  DERRETIMENTO COM LAVA
		if Homun == DIETER
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8041; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  LUZ SALVADORA
		--  ILLUMINATUS
		--  IMPACTO PRECISO
		if Homun == BAYERI 
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8033; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8034; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8031; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  CAPRICHO
		if Homun == VANILMIRTH or Homun == VANILMIRTH_H or Homun == VANILMIRTH2 or Homun == VANILMIRTH_H2 
		or Homun == ELEANOR 
		or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8013; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  ESTILO DE LUTA
		if Homun == ELEANOR 
		then 
			Available[slot] = {}; Available[slot]["Skill"] = 8027; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  TROCA DE LUGAR
		if Homun == AMISTR or Homun == AMISTR_H or Homun == AMISTR2 or Homun == AMISTR_H2
		or Homun == ELEANOR or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8005; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  BÊNÇÃO CAÓTICA
		if Homun == VANILMIRTH or Homun == VANILMIRTH_H or Homun == VANILMIRTH2 or Homun == VANILMIRTH_H2 
		or Homun == ELEANOR 
		or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8014; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  CINZAS VULCÂNICAS
		if Homun == DIETER
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8043; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  VÔO FRENÉTICO
		--  VÔO ACELERADO
		if Homun == FILIR or Homun == FILIR_H or Homun == FILIR2 or Homun == FILIR_H2
		or Homun == ELEANOR or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8010; Available[slot]["Level"] = 5;  slot = slot + 1; 
			Available[slot] = {}; Available[slot]["Skill"] = 8011; Available[slot]["Level"] = 5;  slot = slot + 1; 
		end
		
		--  SEDE DE SANGUE
		--  FORTALEZA
		if Homun == AMISTR or Homun == AMISTR_H or Homun == AMISTR2 or Homun == AMISTR_H2
		or Homun == ELEANOR or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8008; Available[slot]["Level"] = 3;  slot = slot + 1;
			Available[slot] = {}; Available[slot]["Skill"] = 8006; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
		
		--  BATER EM RETIRADA
		if Homun == LIF or Homun == LIF_H or Homun == LIF2 or Homun == LIF_H2 
		or Homun == ELEANOR or Homun == DIETER or Homun == BAYERI or Homun == SERA or Homun == EIRA
		then
			Available[slot] = {}; Available[slot]["Skill"] = 8002; Available[slot]["Level"] = 5;  slot = slot + 1;
		end
	
	--  Assistente.
	elseif aiType == 2 and Merce then
		
		--  Rapidez com Arma.
		if (Merce ==  3) or (Merce == 23)                     then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8223; Available[slot]["Level"] = 1;  slot = slot + 1; end
		
		if (Merce ==  8) or (Merce == 16)                     then --  Nv. 2.
			Available[slot] = {}; Available[slot]["Skill"] = 8223; Available[slot]["Level"] = 2;  slot = slot + 1; end
		
		if (Merce == 10) or (Merce == 20) or (Merce == 26) or (Merce == 203) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8223; Available[slot]["Level"] = 5;  slot = slot + 1; end
		
		if (Merce == 28) or (Merce == 30)                     then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8223; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Rajada de Flechas.
		if (Merce ==  1) then --  Nv. 2.
			Available[slot] = {}; Available[slot]["Skill"] = 8207; Available[slot]["Level"] = 2;  slot = slot + 1; end
		if (Merce ==  5) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8207; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce ==  6) then --  Nv. 7.
			Available[slot] = {}; Available[slot]["Skill"] = 8207; Available[slot]["Level"] = 7;  slot = slot + 1; end
		if (Merce ==  9) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8207; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Golpe Fulminante.
		if (Merce == 21)                     then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8201; Available[slot]["Level"] = 1;  slot = slot + 1; end
		if (Merce == 25) or (Merce ==  201) or (Merce ==  203) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8201; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce == 27) or (Merce == 30) or (Merce == 208) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8201; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Chuva de Flechas.
		if (Merce ==  2) then --  Nv. 2.
			Available[slot] = {}; Available[slot]["Skill"] = 8208; Available[slot]["Level"] = 2;  slot = slot + 1; end
		if (Merce ==  7) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8208; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Disparo Violento.
		if (Merce ==  3) or (Merce ==  9) or (Merce ==  10) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8214; Available[slot]["Level"] = 1;  slot = slot + 1; end
		
		--  Chama Reveladora.
		if (Merce ==  2) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8224; Available[slot]["Level"] = 1;  slot = slot + 1; end
		
		--  Magnificat.
		if (Merce ==  4) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8222; Available[slot]["Level"] = 1;  slot = slot + 1; end
		
		--  Provocar.
		if (Merce ==  5) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8232; Available[slot]["Level"] = 1;  slot = slot + 1; end
		if (Merce ==  8) then --  Nv. 3.
			Available[slot] = {}; Available[slot]["Skill"] = 8232; Available[slot]["Level"] = 3;  slot = slot + 1; end
		if (Merce == 18) or (Merce == 22) or (Merce ==  202) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8232; Available[slot]["Level"] = 5;  slot = slot + 1; end
		
		--  Diminuir Agilidade.
		if (Merce ==  6) or (Merce == 21) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8234; Available[slot]["Level"] = 1;  slot = slot + 1; end
		if (Merce == 26) then --  Nv. 3.
			Available[slot] = {}; Available[slot]["Skill"] = 8234; Available[slot]["Level"] = 3;  slot = slot + 1; end
		
		--  Tiro Preciso.
		if (Merce == 10) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8215; Available[slot]["Level"] = 1;  slot = slot + 1; end
		
		--  Perfurar.
		if (Merce == 11) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8216; Available[slot]["Level"] = 1;  slot = slot + 1; end
		if (Merce == 13) then --  Nv. 2.
			Available[slot] = {}; Available[slot]["Skill"] = 8216; Available[slot]["Level"] = 2;  slot = slot + 1; end
		if (Merce == 15) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8216; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce == 18) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8216; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Brandir Lança.
		if (Merce == 12) then --  Nv. 2.
			Available[slot] = {}; Available[slot]["Skill"] = 8217; Available[slot]["Level"] = 2;  slot = slot + 1; end
		if (Merce == 16) or (Merce == 202) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8217; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce == 19) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8217; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Bloqueio.
		if (Merce == 15) then --  Nv. 3.
			Available[slot] = {}; Available[slot]["Skill"] = 8220; Available[slot]["Level"] = 3;  slot = slot + 1; end
		if (Merce == 201) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8220; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce == 19) then --  Nv. 7.
			Available[slot] = {}; Available[slot]["Skill"] = 8220; Available[slot]["Level"] = 3;  slot = slot + 1; end
		if (Merce == 20) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8220; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Impacto.
		if (Merce == 24) then --  Nv. 1.
			Available[slot] = {}; Available[slot]["Skill"] = 8225; Available[slot]["Level"] = 1;  slot = slot + 1; end
		if (Merce == 29) then --  Nv. 3.
			Available[slot] = {}; Available[slot]["Skill"] = 8225; Available[slot]["Level"] = 3;  slot = slot + 1; end
		if (Merce == 14) or (Merce == 25) then --  Nv. 4.
			Available[slot] = {}; Available[slot]["Skill"] = 8225; Available[slot]["Level"] = 4;  slot = slot + 1; end
		if (Merce == 204) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8225; Available[slot]["Level"] = 5;  slot = slot + 1; end
		
		--  Perfurar em Espiral.
		if (Merce == 20) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8218; Available[slot]["Level"] = 5;  slot = slot + 1; end
		
		--  Impacto Explosivo.
		if (Merce == 22) then --  Nv. 3.
			Available[slot] = {}; Available[slot]["Skill"] = 8202; Available[slot]["Level"] = 3;  slot = slot + 1; end
		if (Merce == 24) or (Merce ==  202) or (Merce ==  204) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8202; Available[slot]["Level"] = 5;  slot = slot + 1; end
		
		--  Impacto de Tyr.
		if (Merce == 28) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8203; Available[slot]["Level"] = 5;  slot = slot + 1; end
		if (Merce == 29) then --  Nv. 8.
			Available[slot] = {}; Available[slot]["Skill"] = 8203; Available[slot]["Level"] = 8;  slot = slot + 1; end
		if (Merce == 30) then --  Nv. 10.
			Available[slot] = {}; Available[slot]["Skill"] = 8203; Available[slot]["Level"] = 10; slot = slot + 1; end
		
		--  Aparar Golpe.
		if (Merce == 28) then --  Nv. 4.
			Available[slot] = {}; Available[slot]["Skill"] = 8204; Available[slot]["Level"] = 4;  slot = slot + 1; end
		
		--  Escudo Refletor.
		if (Merce == 29) then --  Nv. 5.
			Available[slot] = {}; Available[slot]["Skill"] = 8205; Available[slot]["Level"] = 4;  slot = slot + 1; end
	
	--  Contar o total de habilidades.
	end; for slot, values in pairs(Available) do Total = Total + 1; end;
end
---------------------------------------------------------------------------