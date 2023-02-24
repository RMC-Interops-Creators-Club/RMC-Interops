ATT.PrintName = "LP"
ATT.Icon = Material("entities/tacint_att_optic_rmr.png", "mips smooth")
ATT.Description = "Low profile optic sight for pistols."
ATT.Pros = {"Zoom"}
ATT.Cons = {"No melee attack"}

ATT.Model = "models/weapons/tacint/addons/optic_rmr.mdl"
ATT.Scale =  1.1
ATT.ModelOffset = Vector(0, 0, -0.35)

ATT.Category = "optic_smg" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 0

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = false
ATT.Override_ScopeFOV = 90 / 1.25
ATT.Override_ScopeLevels = 1
ATT.Override_ScopeHideWeapon = false

ATT.Mult_QuickScopeTime = 0.85

ATT.Add_ScopedSpreadPenalty = -0.0015
ATT.Add_HipFireSpreadPenalty = 0.005