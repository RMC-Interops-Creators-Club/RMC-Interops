SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()
DEFINE_BASECLASS( "tacint_base" )

// names and stuff
SWEP.PrintName = "Jackal Knife"
SWEP.Category = "Tactical Intervention Extras (RMC)"

SWEP.Description = "A fancy knife for rich operators who want to show off their wealth."

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

SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.25

SWEP.Scope = false

SWEP.FreeAim = false

SWEP.QuickNadeTimeMult = 1.5

// hold types

SWEP.HoldType = "knife"
SWEP.HoldTypeSprint = "knife"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.GestureBash = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, 0)

SWEP.SprintAng = Angle(0, -25, -10)
SWEP.SprintPos = Vector(3, 0, -2)

SWEP.SprintMidPoint = {
    Pos = Vector(0.25, 2, 1),
    Ang = Angle(0, -5, 10)
}

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["melee"] = "melee"
}

// attachments

SWEP.Attachments = {}