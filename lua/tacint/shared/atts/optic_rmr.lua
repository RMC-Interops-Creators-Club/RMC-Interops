ATT.PrintName = "RMR"
ATT.FullName = "RMR Pistol Sight"
ATT.Icon = Material("entities/tacint_att_optic_rmr.png", "mips smooth")
ATT.Description = "Low profile optic sight for pistols. 1.25x zoom."
ATT.Pros = {"Zoom"}
ATT.Cons = {"Increased hipfire spread", "Disables melee attack"}

ATT.Model = "models/weapons/tacint/addons/optic_rmr.mdl"
ATT.Scale =  1

ATT.Category = "optic_pistol" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = false
ATT.Override_ScopeFOV = 90 / 1.25
ATT.Override_ScopeLevels = 1
ATT.Override_ScopeHideWeapon = false

ATT.Mult_QuickScopeTime = 0.85

ATT.Add_ScopedSpreadPenalty = -0.0025
ATT.Add_HipFireSpreadPenalty = 0.0075
ATT.Mult_MoveSpreadPenalty = 1.15