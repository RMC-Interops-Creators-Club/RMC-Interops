ATT.PrintName = "Flashlight"
ATT.Icon = Material("entities/tacint_att_tac_flashlight.png", "mips smooth")
ATT.Description = "Tactical device which illuminates enemies and improves spread."
ATT.Pros = {"Spread"}

ATT.Model = "models/weapons/tacint/addons/flashlight_mounted.mdl"
ATT.Scale = 1

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 2

ATT.Mult_Spread = 0.9

ATT.Flashlight = true