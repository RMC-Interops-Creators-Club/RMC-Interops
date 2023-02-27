ATT.PrintName = "SP-R Irons"
ATT.FullName = "SP-RIron Sights"
ATT.Icon = Material("entities/tacint_att_optic_irons.png", "mips smooth")
ATT.Description = "Basic sights that won't be damaged by striking with the weapon."
ATT.Pros = {"Enables melee attack"}
ATT.Cons = {"Disables zooming"}

ATT.Free = true

ATT.InstalledElements = {"irons"}

ATT.Scale = 0.3
ATT.ModelOffset = Vector(0, 0, 0.7)

ATT.Category = "ironsights_spr" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 0

ATT.Override_Scope = false

ATT.Add_HipFireSpreadPenalty = -0.28
ATT.Add_CrouchSpreadPenalty = -0.025
ATT.Add_RecoilDissipationRate = 0.9
ATT.Mult_MoveSpreadPenalty = 2