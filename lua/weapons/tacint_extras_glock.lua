SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "G18C"
SWEP.Category = "RMC Interops (Handguns)"

SWEP.Description = "Fully-automatic 9mm pistol with poor accuracy but a insanely quick rate of fire."

SWEP.ViewModel = "models/weapons/tacint_extras/v_glock18.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_glock18.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 100 / 8
SWEP.Damage_Min = 100 / 12
SWEP.Range_Min = 400 // distance for which to maintain maximum damage
SWEP.Range_Max = 1000 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 1200

SWEP.Spread = 0
SWEP.HipFireSpreadPenalty = 0.025 // spread penalty for not being scoped in

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 15
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilKick = 0.1

SWEP.RecoilSpreadPenalty = 0.015

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.6
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2

SWEP.SprintToFireTime = 0.25

// hold types

SWEP.HoldType = "revolver"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -12)

SWEP.SightAng = Angle(-0.01, 0.55, 0)
SWEP.SightPos = Vector(-3.26, 0, -3.65)

SWEP.CorrectivePos = Vector(0.02, -1, 0)
SWEP.CorrectiveAng = Angle(0.05, -0.05, 0)

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1.4

SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/glock.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint/weapons/p2000/p2000_"
local path2 = "tacint_extras/glock/"

SWEP.Sound_Shoot = "^" .. path2 .. "glock18-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_pistol"

// anims

// VM:
// idle
// fire
// fire1, fire2...
// dryfire
// melee
// reload
// midreload
// prime_grenade
// throw_grenade
// throw_grenade_underhand
// deploy
// blind_idle
// blind_fire
// blind_fire1, blind_fire2...
// blind_dryfire

// WM:
// attack1
SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire_iron"] = "shoot2",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.NoIdle = true

SWEP.ShootTimeMult = 0.45

SWEP.LastShot = true

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.9,
        WMScale = 1.2,
        Pos_VM = Vector(0.21, 0.7, -0.05),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0, -3, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2.1, -0.23, 6.6),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_extras_glock.clip_in", path2 .. "Clipin.wav")
addsound("tacint_extras_glock.clip_in-mid", path .. "clip_in-mid.wav")
addsound("tacint_extras_glock.clip_out", path2 .. "Clipout.wav")
addsound("tacint_extras_glock.slide_action", path .. "slide_action.wav")
addsound("tacint_extras_glock.slide_shut", path .. "slide_shut.wav")
addsound("tacint_extras_glock.cock_hammer", path .. "cockhammer.wav")
