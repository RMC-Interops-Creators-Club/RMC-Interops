SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Vector"
SWEP.Category = "RMC Interops (Small Arms)"

SWEP.Description = ".45 SMG with extremely fast fire rate."

SWEP.ViewModel = "models/weapons/tacint/v_superv.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_superv.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 100 / 5 // damage at minimum range
SWEP.Damage_Min = 100 / 7 // damage at maximum range
SWEP.Range_Min = 1000 // distance for which to maintain maximum damage
SWEP.Range_Max = 3000 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 1000

SWEP.Spread = 0.015

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.017 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.065 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.006
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.004

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.1 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.15
SWEP.RecoilVisualShake = 0.35

SWEP.RecoilKick = 1.5

SWEP.RecoilSpreadPenalty = 0.007 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.95
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.33 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -4, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

// reload

SWEP.ClipSize = 32
SWEP.Ammo = "ti_45acp"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/superv.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint/weapons/superv/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"

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
    ["fire1"] = "fire1_L",
    ["fire2"] = "fire2_L",
    ["fire3"] = "fire3_L",
    ["fire4"] = "fire4_L",
    ["fire5"] = "fire5_L",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
    ["optic"] = {
        BGs_VM = {
            {1, 1}
        },
    },
    ["tactical"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_smg", "optic_cqb", "optic_medium"},
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-3.9, 0, 5),
        Pos_WM = Vector(7, 1.5, -5.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-1.3, -0.1, 19),
        Pos_WM = Vector(23, 2.5, -2.8),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-1.15, -1.1, 11),
        Pos_WM = Vector(14, 3, -3),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -3.5, 90),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"foldstock", "perk", "perk_melee", "perk_shooting", "perk_hollowpoints", "perk_reload"},
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

addsound("tacint_superv.Clip_Out", path .. "clip_out-1.wav")
addsound("tacint_superv.Clip_In", path .. "clip_in-1.wav")
addsound("tacint_superv.bolt_release", path .. "bolt_release-1.wav")
addsound("tacint_superv.bolt_back", path .. "bolt_back-1.wav")
addsound("tacint_superv.bolt_forward", path .. "bolt_forward-1.wav")