ATT.PrintName = "Compensator"
ATT.FullName = "Pistol Compensator"
ATT.Icon = Material("entities/tacint_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "Pistol muzzle device that reduces first shot recoil."
ATT.Pros = {"Reduced first shot recoil"}
ATT.Cons = {"Increased recoil accumulation"}

ATT.Model = "models/weapons/tacint/addons/pistol_comp.mdl"
ATT.Scale = 2
ATT.ModelOffset = Vector(-17.75, 0, -3.5)

ATT.Category = "pistol_muzzle" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_RecoilFirstShotMult = 0.8
ATT.Mult_RecoilPerShot = 1.25
ATT.Mult_RecoilMaximum = 1.25