ATT.PrintName = "M14 Irons"
ATT.FullName = "M14 Iron Sights"
ATT.Icon = Material("entities/tacint_att_optic_irons.png", "mips smooth")
ATT.Description = "Basic sights that won't be damaged by striking with the weapon."
ATT.Pros = {"Enables melee attack"}
ATT.Cons = {"Disables zooming"}

ATT.Free = true

ATT.InstalledElements = {"irons"}

ATT.Scale = 0.3
ATT.ModelOffset = Vector(0, 0, 0.7)

ATT.Category = "ironsights_m14" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 0

ATT.Override_Scope = false

ATT.Add_HipFireSpreadPenalty = -0.03
ATT.Add_CrouchSpreadPenalty = -0.025
ATT.Mult_MoveSpreadPenalty = 2