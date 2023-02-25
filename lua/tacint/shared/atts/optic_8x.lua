ATT.PrintName = "8x"
ATT.Icon = Material("entities/tacint_att_optic_8x.png", "mips smooth")
ATT.Description = "Long-range two-level sniper optic."
ATT.Pros = {"Multi-level zoom and reduced scoped spread"}
ATT.Cons = {"Increased hipfire spread and no melee attack"}

ATT.Model = "models/weapons/tacint/addons/8x.mdl"
ATT.Scale = 1
ATT.ModelOffset = Vector(-1.5, 0, -0.3)

ATT.Category = "optic_sniper" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 3

ATT.Override_Scope = true
ATT.Override_ScopeOverlay = Material("tacint/scopes/sniper.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 8
ATT.Override_ScopeLevels = 2
ATT.Override_ScopeHideWeapon = true

ATT.Mult_QuickScopeTime = 1.25

ATT.Add_ScopedSpreadPenalty = -0.012
ATT.Add_HipFireSpreadPenalty = 0.06
ATT.Mult_MoveSpreadPenalty = 1.5

ATT.Ignore = false