ATT.PrintName = "Flashlight"
ATT.FullName = "Tactical High-Power Weaponlight"
ATT.Icon = Material("entities/tacint_att_tac_flashlight.png", "mips smooth")
ATT.Description = "Tactical flashlight that improves visibility by illuminating dark areas."
ATT.Pros = {"Increased flashlight range", "Reduced hipfire spread"}
ATT.Cons = {"Reduced handling"}

ATT.Model = "models/weapons/tacint/addons/flashlight_mounted.mdl"
ATT.Scale = 1

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 2

ATT.Mult_HipFireSpreadPenalty = 0.67
ATT.Mult_SprintToFireTime = 1.18

ATT.Flashlight = true
ATT.CanToggle = true
