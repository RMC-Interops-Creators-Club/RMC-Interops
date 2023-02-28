ATT.PrintName = "LVG"
ATT.FullName = "Low Velocity Grenades"
ATT.Icon = Material("entities/tacint_att_ammo_40mm_lvg.png", "mips smooth")
ATT.Description = "Shaped charge with a slower velocity that can bounce off walls."
ATT.Pros = {"Rounds bounce off walls once before detonating"}
ATT.Cons = {"Slower velocity"}

ATT.Category = "ammo_40mm" // can be "string" or {"list", "of", "strings"}

ATT.ShootEnt = "tacint_proj_40mm_lvg"
ATT.Mult_ShootEntForce = 0.75

ATT.InstalledElements = {"lvg"}