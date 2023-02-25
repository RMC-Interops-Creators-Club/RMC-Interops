ATT.PrintName = "Hollowpoints"
ATT.Icon = Material("entities/tacint_att_acc_hollowpoints.png", "mips smooth")
ATT.Description = "Bullets that improve damage, but are available only in a small magazine."
ATT.Pros = {"Increased damage"}
ATT.Cons = {"Reduced mag capacity"}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "perk_hollowpoints" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Override_ClipSize = 20

ATT.Mult_Damage_Min = 1.2
ATT.Mult_Damage_Max = 1.2