SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Jackal Knife"
SWEP.Category = "RMC Interops (Smallarms)"

SWEP.Description = "Fancy collectors knife, not meant for combat but looks cool."

SWEP.ViewModel = "models/weapons/tacint/v_knife2.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_knife2.mdl"

SWEP.NoRanger = true
SWEP.NoStatBox = true

SWEP.NPCUsable = false

SWEP.Slot = 0

// misc. shooting

SWEP.Ammo = ""
SWEP.ClipSize = -1

// handling

SWEP.MoveSpeedMult = 1

SWEP.PrimaryMelee = true
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.15

SWEP.Scope = false

SWEP.FreeAim = false

SWEP.QuickNadeTimeMult = 0.75

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
    ["melee"] = "melee",
    ["idle"] = "idle"
}

// attachments

SWEP.Attachments = {}