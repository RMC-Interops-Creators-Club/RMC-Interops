ATT.PrintName = "Slug"
ATT.FullName = "Slug Rounds"
ATT.Icon = Material("entities/tacint_att_acc_hollowpoints.png", "mips smooth")
ATT.Description = "Single large projectile with good accuracy and damage."
ATT.Pros = {"Increased damage", "Reduced spread"}
ATT.Cons = {"One pellet"}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "perk_slug" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_HipFireSpreadPenalty = 0.5
ATT.Mult_ScopedSpreadPenalty = 0.5
ATT.Override_Num = 1
ATT.Mult_Damage_Min = 2
ATT.Mult_Damage_Max = 3