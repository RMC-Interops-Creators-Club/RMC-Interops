ATT.PrintName = "LVG"
ATT.FullName = "Impact Rounds"
ATT.Icon = Material("entities/tacint_att_ammo_40mm_lvg.png", "mips smooth")
ATT.Description = "Shaped charge with higher damage but a smaller explosion radius."
ATT.Pros = {"Increaed damage"}
ATT.Cons = {"Reduced blast radius"}

ATT.Category = "ammo_40mm" // can be "string" or {"list", "of", "strings"}

ATT.ShootEnt = "tacint_proj_40mm_lvg"
ATT.Mult_ShootEntForce = 0.75

ATT.InstalledElements = {"lvg"}