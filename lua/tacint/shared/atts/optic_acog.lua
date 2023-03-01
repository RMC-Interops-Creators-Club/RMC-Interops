ATT.PrintName = "ACOG"
ATT.FullName = "Advanced Combat Optical Gunsight"
ATT.Icon = Material("entities/tacint_att_optic_acog.png", "mips smooth")
ATT.Description = "Medium-to-long range combat scope. 3.5x zoom."
ATT.Pros = {"Zoom"}
ATT.Cons = {"Increased hipfire spread", "Increased moving spread", "Disables melee attack"}

ATT.Model = "models/weapons/tacint/addons/acog.mdl"
ATT.Scale = 0.3
ATT.ModelOffset = Vector(-1.5, 0, 0.7)

ATT.Category = "optic_medium" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 2

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = Material("tacint/scopes/acog.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 3.5
ATT.Override_ScopeLevels = 1
ATT.Override_ScopeHideWeapon = true

ATT.Mult_QuickScopeTime = 0.75

ATT.Mult_ScopedSpreadPenalty = 0.6
ATT.Mult_HipFireSpreadPenalty = 1.45
ATT.Mult_MoveSpreadPenalty = 1.35