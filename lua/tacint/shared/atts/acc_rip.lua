ATT.PrintName = "RIP"
ATT.FullName = "Radically Invasive Projectile"
ATT.Icon = Material("entities/tacint_att_acc_hollowpoints.png", "mips smooth")
ATT.Description = "Special pistol rounds that improve damage but worsen damage falloff."
ATT.Pros = {"Increased damage"}
ATT.Cons = {"Faster damage dropoff",}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "perk_rip" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_Range_Max = 0.8
ATT.Mult_Range_Min = 0.8
ATT.Mult_Damage_Min = 0.6
ATT.Mult_Damage_Max = 1.5