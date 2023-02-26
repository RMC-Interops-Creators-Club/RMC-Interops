ATT.PrintName = "Quickdraw"
ATT.Icon = Material("entities/tacrp_att_acc_foldstock.png", "mips smooth")
ATT.Description = "Disregarding safety, improving handling at the cost of recoil."
ATT.Pros = {"Handling"}
ATT.Cons = {"Recoil", "Sway"}

ATT.Free = true

ATT.Category = "acc_foldstock" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

-- todo: actual stats that aren't just edits of folded stock

ATT.Mult_VisualRecoilKick = 1.5
ATT.Mult_RecoilKick = 2.5
ATT.Mult_SprintToFireTime = 0.6
ATT.Mult_AimDownSightsTime = 0.6
ATT.Mult_SightedSpeedMult = 1.4

ATT.Mult_ScopedSway = 2.75
ATT.Mult_Sway = 1.75


ATT.InstalledElements = {"quickdraw"}

ATT.TryUnholster = true