ATT.PrintName = "Ext. Mag"
ATT.FullName = "200-Round Belt"
ATT.Icon = Material("entities/tacint_att_acc_extendedbelt.png", "mips smooth")
ATT.Description = "Extended belt with higher capacity, but worsens handling."
ATT.Pros = {"Increased mag capacity"}
ATT.Cons = {"Reduced handling"}

ATT.Category = "extendedbelt" // can be "string" or {"list", "of", "strings"}

ATT.Override_ClipSize = 200
ATT.Mult_SprintToFireTime = 1.5
ATT.Mult_DeployTimeMult = 1.5
ATT.Mult_ReloadTimeMult = 1.25