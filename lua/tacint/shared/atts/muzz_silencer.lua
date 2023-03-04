ATT.PrintName = "Silencer"
ATT.FullName = "Sound Suppressor"
ATT.Icon = Material("entities/tacint_att_muzz_silencer.png", "mips smooth")
ATT.Description = "Muzzle device that reduces the weapon's audible report and recoil."
ATT.Pros = {"Reduced recoil", "Reduced firing noise"}
ATT.Cons = {"Faster damage dropoff"}

ATT.Model = "models/weapons/tacint/addons/silencer.mdl"
ATT.Scale = 0.35

ATT.Category = "silencer" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Add_Vol_Shoot = -20
ATT.Mult_RecoilPerShot = 0.85
ATT.Mult_Range_Max = 0.72

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"