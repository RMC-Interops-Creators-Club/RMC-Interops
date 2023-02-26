ATT.PrintName = "Red Dot"
ATT.FullName = "Red Dot Combat Gunsight"
ATT.Icon = Material("entities/tacint_att_optic_rds.png", "mips smooth")
ATT.Description = "Medium range combat sight. 1.75x zoom."
ATT.Pros = {"Zoom"}
ATT.Cons = {"Increased hipfire spread", "Disables melee attack"}

ATT.Model = "models/weapons/tacint/addons/reddot.mdl"
ATT.Scale = 0.35
ATT.ModelOffset = Vector(0, 0, 1.2)

ATT.Category = "optic_cqb" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = false
ATT.Override_ScopeFOV = 90 / 1.75
ATT.Override_ScopeLevels = 1
ATT.Override_ScopeHideWeapon = false

ATT.Mult_QuickScopeTime = 0.75

ATT.Add_ScopedSpreadPenalty = -0.005
ATT.Add_HipFireSpreadPenalty = 0.02