ATT.PrintName = "Laser"
ATT.FullName = "Tactical Laser Pointer Module"
ATT.Icon = Material("entities/tacint_att_tac_laser.png", "mips smooth")
ATT.Description = "Tactical laser with a bright beam that helps keep your shots on target."
ATT.Pros = {"Reduced spread accumulation"}
ATT.Cons = {"Reduced handling", "Beam is visible to other players"}

ATT.Model = "models/weapons/tacint/addons/laser_mounted.mdl"
ATT.Scale = 1

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_RecoilSpreadPenalty = 0.5
ATT.Mult_SprintToFireTime = 1.18

ATT.Laser = true
ATT.CanToggle = false