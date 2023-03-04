ATT.PrintName = "TMJ"
ATT.FullName = "Total Metal Jacket Rounds"
ATT.Icon = Material("entities/tacint_att_acc_tmj.png", "mips smooth")
ATT.Description = "Copper rounds that increase penetration but reduce stopping power."
ATT.Pros = {"Increased penetration"}
ATT.Cons = {"Reduced max damage"}

ATT.Category = "perk_tmj" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_Penetration = 4
ATT.Mult_Damage_Max = 0.9