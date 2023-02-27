SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "P226"
SWEP.Category = "RMC Interops (Smallarms)"

SWEP.Description = ".357 SIG handgun that maintains damage over range."

SWEP.ViewModel = "models/weapons/tacint_extras/v_p226.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_p250.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 23 // damage at minimum range
SWEP.Damage_Min = 19 // damage at maximum range
SWEP.Range_Min = 600 // distance for which to maintain maximum damage
SWEP.Range_Max = 2050 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 450

SWEP.Spread = 0.003

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.025 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.065 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.002
SWEP.BlindFireSpreadPenalty = 0 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.006

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 6
SWEP.RecoilResetTime = 0.2 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 0.85

SWEP.RecoilKick = 0.15

SWEP.RecoilSpreadPenalty = 0.004 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.99
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

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

// reload

SWEP.ClipSize = 12
SWEP.Ammo = "ti_9mm"

SWEP.ReloadTimeMult = 1.1

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/p250.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint_extras/p226/"
local path1 = "tacint/weapons/p250/"

SWEP.Sound_Shoot = "^" .. path .. "p228-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "p250_fire_silenced-1.wav"

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
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

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
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-0.04, -0.7, -0.1),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0, -1, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-0.55, 0.45, 6.5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.p250_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        VMScale = 0.9,
        WMScale = 1.3,
        Pos_VM = Vector(-2.1, -0.1, 5.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload", "acc_quickdraw"},
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

addsound("tacint_p226.clip_in", path .. "magshove.wav")
addsound("tacint_p226.clip_in-mid", path .. "magshove.wav")
addsound("tacint_p226.clip_out", path .. "magout.wav")
addsound("tacint_p226.slide_action", path1 .. "p250_slide_action.wav")
addsound("tacint_p226.slide_shut", path .. "sliderelease.wav")
addsound("tacint_p226.cock_hammer", path .. "cockhammer.wav")
