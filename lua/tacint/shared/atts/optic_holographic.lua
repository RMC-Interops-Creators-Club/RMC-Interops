ATT.PrintName = "Holographic"
ATT.Icon = Material("entities/tacint_att_optic_holographic.png", "mips smooth")
ATT.Description = "Boxy optic that helps to improve mid-range aim."
ATT.Pros = {"Zoom"}
ATT.Cons = {"No melee attack"}

ATT.Model = "models/weapons/tacint/addons/holosight.mdl"
ATT.Scale = 0.35

ATT.Category = "optic_cqb" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = false
ATT.Override_ScopeFOV = 90 / 1.5
ATT.Override_ScopeLevels = 1
ATT.Override_ScopeHideWeapon = false

ATT.Mult_QuickScopeTime = 0.75

ATT.Add_ScopedSpreadPenalty = -0.005
ATT.Add_HipFireSpreadPenalty = 0.01
ATT.Mult_MoveSpreadPenalty = 1.25