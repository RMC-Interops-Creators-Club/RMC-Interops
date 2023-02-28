ATT.PrintName = "3GL"
ATT.FullName = "Cluster Rounds"
ATT.Icon = Material("entities/tacint_att_ammo_40mm_3gl.png", "mips smooth")
ATT.Description = "A single round containg 3 small grenades fired in a cluster."
ATT.Pros = {"3-round cluster"}
ATT.Cons = {"Reduced damage"}

ATT.Category = "ammo_40mm" // can be "string" or {"list", "of", "strings"}

ATT.ShootEnt = "tacint_proj_40mm_3gl"
ATT.Num = 3

ATT.InstalledElements = {"3gl"}

ATT.Add_Spread = 0.05