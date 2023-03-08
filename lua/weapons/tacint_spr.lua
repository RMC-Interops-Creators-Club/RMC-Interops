SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "R700 SP-R"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "7.62 NATO bolt-action hunting rifle. More effective at close range than other snipers."

SWEP.ViewModel = "models/weapons/tacint/v_spr.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_spr.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 3 // damage at minimum range
SWEP.Damage_Min = 50 // damage at maximum range
SWEP.Range_Min = 975 // distance for which to maintain maximum damage
SWEP.Range_Max = 1500 // distance at which we drop to minimum damage
SWEP.Penetration = 4 // units of metal this weapon can penetrate
SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1.25,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.8
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 43

SWEP.Spread = 0.02

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.10 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.15 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.3 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.02
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.005

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 0.6
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 0.2

SWEP.RecoilKick = 5

SWEP.RecoilSpreadPenalty = 0.35 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.94
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.30 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, -45)
SWEP.BlindFirePos = Vector(1, -2, -2)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacint/scopes/sniper.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 6
SWEP.ScopeLevels = 1 // 2 = like CS:S

SWEP.QuickScopeSpreadPenalty = 0.1
SWEP.QuickScopeTime = 0.33 // amount of time over which to fade out the quickscope spread penalty

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.05
SWEP.DropMagazineModel = false

// sounds

local path = "tacint/weapons/spr/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "tacint/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectEffect = 2
SWEP.EjectDelay = 0.85

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
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "shoot1"
}

// attachments

SWEP.AttachmentElements = {
    ["optic"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["irons"] = {
        BGs_VM = {
            {2, 1}
        },
        Mult_HipFireSpreadPenalty = 0,
        Mult_CrouchSpreadPenalty = -0.025,
        Mult_MoveSpreadPenalty = 5.5,
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights", "optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-3.95, 0.1, 9),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(-3, 1.25, -5.6),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.85, 0.125, 42),
        Pos_WM = Vector(23, 2.5, -2.8),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-2, -0.8, 20),
        Pos_WM = Vector(14, 3, -3),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -3.5, 90),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload", "perk_tmj"},
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

addsound("tacint_spr.Clip_Out", path .. "clip_out-1.wav")
addsound("tacint_spr.Clip_In", path .. "clip_in-1.wav")
addsound("tacint_spr.Bolt_Back", path .. "bolt_back-1.wav")
addsound("tacint_spr.bolt_forward", path .. "bolt_forward-1.wav")
addsound("tacint_spr.safety", path .. "safety-1.wav")