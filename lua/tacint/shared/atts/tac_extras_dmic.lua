ATT.PrintName = "Radar"
ATT.FullName = "Tactical Omnidirectional Microphone"
ATT.Icon = Material("entities/tacrp_att_tac_extras_dmic.png", "mips smooth")
ATT.Description = "Shows the position of nearby enemies."
ATT.Pros = {"Radar"}

ATT.Model = "models/weapons/tacint/addons/dmic_mounted.mdl"
ATT.Scale = 0.75
ATT.ModelOffset = Vector(-0.25, 0, 0)

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.Minimap = true
ATT.CanToggle = true