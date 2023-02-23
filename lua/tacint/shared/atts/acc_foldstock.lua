ATT.PrintName = "Folded Stock"
ATT.Icon = Material("entities/tacint_att_acc_foldstock.png", "mips smooth")
ATT.Description = "Keep stock folded, improving handling at the cost of recoil."
ATT.Pros = {"Handling"}
ATT.Cons = {"First Shot Recoil"}

ATT.Free = true

ATT.Category = "foldstock" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Add_RecoilFirstShotMult = 0.5
ATT.Mult_RecoilKick = 1.5
ATT.Mult_SprintToFireTime = 0.75

ATT.InstalledElements = {"foldstock"}

ATT.TryUnholster = true