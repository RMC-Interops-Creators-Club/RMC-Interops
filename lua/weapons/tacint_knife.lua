SWEP.Base = "tacint_base"
SWEP.Spawnable = true
SWEP.Melee = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Tactical Knife"
SWEP.Category = "RMC Interops (Utilities)"

SWEP.Description = "Foldable tactical knife for survival situations and close-quarters combat scenarios."

SWEP.ViewModel = "models/weapons/tacint/v_knife.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_knife.mdl"

SWEP.NoRanger = true
SWEP.NoStatBox = true

SWEP.NPCUsable = false

SWEP.Slot = 0

SWEP.MeleeDamage = 60
SWEP.MeleeDelay = 0.70

// misc. shooting

SWEP.Ammo = ""
SWEP.ClipSize = -1

// handling
SWEP.Spread = 0.01
SWEP.MoveSpreadPenalty = 0
SWEP.MidAirSpreadPenalty = 0
SWEP.HipFireSpreadPenalty = 0
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0
SWEP.CrouchSpreadPenalty = 0

SWEP.MoveSpeedMult = 1

SWEP.PrimaryMelee = true
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.1

SWEP.Scope = false

SWEP.FreeAim = false

SWEP.QuickNadeTimeMult = 0.75

// sounds

local path = "tacint/weapons/knife/"

SWEP.Sound_Shoot = {path .. "swing-1.wav", path .. "swing-2.wav", path .. "swing-3.wav", path .. "swing-4.wav", path .. "swing-5.wav", path .. "swing-6.wav"}

// hold types

SWEP.HoldType = "knife"
SWEP.HoldTypeSprint = "knife"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.GestureBash = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2.5, -1, -4)

SWEP.SprintAng = Angle(0, -25, -10)
SWEP.SprintPos = Vector(3, 0, -2)

SWEP.SprintMidPoint = {
    Pos = Vector(0.25, 2, 1),
    Ang = Angle(0, -5, 10)
}

SWEP.AnimationTranslationTable = {
    ["deploy"] = "deploy",
    ["melee"] = {"slash_left1", "slash_left2", "slash_right1", "slash_right2", "slash_forward1", "slash_forward2"}
}

// attachments

SWEP.Attachments = {}