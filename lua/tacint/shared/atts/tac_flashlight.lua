ATT.PrintName = "Flashlight"
ATT.FullName = "Tactical Flashlight"
ATT.Icon = Material("entities/tacint_att_tac_flashlight.png", "mips smooth")
ATT.Description = "Tactical flashlight that illuminates targets."
ATT.Pros = {"Toggleable high-power flashlight", "Reduced hipfire spread"}
ATT.Cons = {"Reduced handling"}

ATT.Model = "models/weapons/tacint/addons/flashlight_mounted.mdl"
ATT.Scale = 1

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 2

ATT.Mult_HipFireSpreadPenalty = 0.8
ATT.Mult_SprintToFireTime = 1.1

ATT.Flashlight = true
ATT.CanToggle = true
