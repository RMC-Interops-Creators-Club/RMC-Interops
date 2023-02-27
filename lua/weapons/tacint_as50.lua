SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AS50"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "High-calibre sniper rifle. Very powerful but very difficult to handle."

SWEP.ViewModel = "models/weapons/tacint/v_as50.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_as50.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 45 // damage at minimum range
SWEP.Damage_Min = 100 // damage at maximum range
SWEP.Range_Min = 2000 // distance for which to maintain maximum damage
SWEP.Range_Max = 4000 // distance at which we drop to minimum damage
SWEP.Penetration = 10 // units of metal this weapon can penetrate
SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.8
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 180

SWEP.Spread = 0

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.15 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.25 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.35 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.05

SWEP.RecoilPerShot = 2.5
SWEP.RecoilMaximum = 5.5
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 3
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.75
SWEP.RecoilVisualShake = 0.9

SWEP.RecoilKick = 5

SWEP.RecoilSpreadPenalty = 0.5 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.5 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.45
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.65 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, 0)
SWEP.BlindFirePos = Vector(2, -2, -4)

SWEP.CustomizeAng = Angle(50, 15, 0)
SWEP.CustomizePos = Vector(12, 6, -8)

SWEP.SprintAng = Angle(40, -15, 0)
SWEP.SprintPos = Vector(5, 0, -4)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacint/scopes/sniper.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 10
SWEP.ScopeLevels = 1 // 2 = like CS:S

SWEP.QuickScopeSpreadPenalty = 0.25
SWEP.QuickScopeTime = 0.6 // amount of time over which to fade out the quickscope spread penalty

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "ti_50bmg"

SWEP.ReloadTimeMult = 1.05
SWEP.DropMagazineImpact = "metal"
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl"

// sounds

local path = "tacint/weapons/as50/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectEffect = 2

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
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2"}
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
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "ValveBiped._ROOT_AS50",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-6.6, 0, 7),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 5, 1.75),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped._ROOT_AS50",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.25,
        Pos_VM = Vector(-4, -1.6, 18),
        Pos_WM = Vector(1.5, 16, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -90, -90),
    },
    [3] = {
        PrintName = "Perk",
        Category = {"perk", "perk_shooting", "perk_reload"},
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

addsound("tacint_as50.Clip_Out", path .. "clip_out.wav")
addsound("tacint_as50.Clip_In", path .. "clip_in.wav")
addsound("tacint_as50.Bolt_Back", path .. "bolt_back.wav")
addsound("tacint_as50.bolt_forward", path .. "bolt_forward.wav")