ATT.PrintName = "Laser"
ATT.Icon = Material("entities/tacint_att_tac_laser.png", "mips smooth")
ATT.Description = "Tactical device which aids your aim.  Significantly improves spread."
ATT.Pros = {"Reduced recoil spread"}
ATT.Cons = {"Reduced handling"}

ATT.Model = "models/weapons/tacint/addons/laser_mounted.mdl"
ATT.Scale = 1

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_RecoilSpreadPenalty = 0.8
ATT.Mult_SprintToFireTime = 1.1

ATT.Laser = true