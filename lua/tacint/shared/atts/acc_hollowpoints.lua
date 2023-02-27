ATT.PrintName = "Hollowpoints"
ATT.FullName = "Hollow-point Rounds"
ATT.Icon = Material("entities/tacint_att_acc_hollowpoints.png", "mips smooth")
ATT.Description = "Powerful hollow-tip rounds that improve damage with a reduced magazine size."
ATT.Pros = {"Increased damage"}
ATT.Cons = {"66% clip capacity"}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "perk_hollowpoints" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_ClipSize = (2/3)

ATT.Mult_Damage_Min = 1.2
ATT.Mult_Damage_Max = 1.2