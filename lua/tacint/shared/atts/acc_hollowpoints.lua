ATT.PrintName = "Hollowpoint"
ATT.FullName = "Hollow-point Rounds"
ATT.Icon = Material("entities/tacint_att_acc_hollowpoints.png", "mips smooth")
ATT.Description = "Hollow-tipped rounds that improve damage but reduce magazine size."
ATT.Pros = {"Increased damage"}
ATT.Cons = {"66% mag capacity"}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "perk_hollowpoints" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_ClipSize = (2/3)

ATT.Mult_Damage_Min = 1.2
ATT.Mult_Damage_Max = 1.2