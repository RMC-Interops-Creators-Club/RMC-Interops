ATT.PrintName = "BUCK"
ATT.FullName = "Buckshot Rounds"
ATT.Icon = Material("entities/tacint_att_ammo_40mm_buck.png", "mips smooth")
ATT.Description = "40mm shotgun shell that fires a large volley of buckshot."

ATT.Category = "ammo_40mm" // can be "string" or {"list", "of", "strings"}

ATT.ShootEnt = false

ATT.Damage_Min = 100 / 16
ATT.Damage_Max = 100 / 8
ATT.Num = 24
ATT.Range_Min = 1000
ATT.Range_Min = 2000
ATT.Penetration = 1
ATT.Spread = 0.1

ATT.Override_Sound_Shoot = "^tacint/weapons/m4star10/fire-2.wav"

ATT.InstalledElements = {"buck"}