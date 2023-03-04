ATT.PrintName = "Compensator"
ATT.FullName = "Pistol Compensator"
ATT.Icon = Material("entities/tacint_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "Pistol muzzle device that reduces first shot recoil."
ATT.Pros = {"Reduced first shot recoil"}
ATT.Cons = {"Increased recoil accumulation"}

ATT.Category = "comp_usp" // can be "string" or {"list", "of", "strings"}
ATT.InvAtt = "muzz_pistol_comp"
ATT.SortOrder = 1

ATT.Mult_RecoilFirstShotMult = 0.8
ATT.Mult_RecoilPerShot = 1.25
ATT.Mult_RecoilMaximum = 1.25

ATT.InstalledElements = {"pistol_comp"}