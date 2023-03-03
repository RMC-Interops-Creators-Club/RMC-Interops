SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AMD65"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "7.62 Soviet assault rifle with a 2-round burst firemode that improves control."

SWEP.ViewModel = "models/weapons/tacint/v_amd65.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_amd65.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 100 / 3 // damage at minimum range
SWEP.Damage_Min = 100 / 5 // damage at maximum range
SWEP.Range_Min = 1000 // distance for which to maintain maximum damage
SWEP.Range_Max = 1600 // distance at which we drop to minimum damage
SWEP.Penetration = 3 // units of metal this weapon can penetrate

// misc. shooting

SWEP.Firemode = -2

SWEP.RPM = 600

SWEP.Spread = 0.005

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.050 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.09 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.006 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0.035 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.003

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.35 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 0.25 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.15
SWEP.RecoilVisualShake = 0.35

SWEP.RecoilKick = 1

SWEP.RecoilSpreadPenalty = 0.0035 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.94
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
SWEP.PassivePos = Vector(0, -2, -4)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)


SWEP.ClipSize = 30
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/ak47.mdl"
SWEP.DropMagazineImpact = "metal"

// sounds

local path = "tacint/weapons/amd65/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "tacint/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"
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
    ["deploy"] = "deploy",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
    ["tactical"] = {
        BGs_VM = {
            {3, 1}
        },
    },
    ["optic"] = {
        BGs_VM = {
            {2, 1}
        },
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        InstalledElements = {"optic"},
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-4.45, 0.25, 5),
        Pos_WM = Vector(0, 3, 0.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.65, 0.25, 25.75),
        Pos_WM = Vector(0, 28, -1.75),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        InstalledElements = {"tactical"},
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        Pos_VM = Vector(-2.5, -0.5, 13),
        Pos_WM = Vector(0, 19, -2),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"foldstock", "perk", "perk_melee", "perk_shooting", "perk_reload", "perk_tmj"},
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

addsound("tacint_ak47.remove_clip", "tacint/weapons/ak47/ak47_remove_clip.wav")
addsound("tacint_ak47.insert_clip", "tacint/weapons/ak47/ak47_insert_clip.wav")
addsound("tacint_AMD65.Bolt_Back", path .. "bolt_back.wav")
addsound("tacint_AMD65.Bolt_Release", path .. "bolt_release.wav")
addsound("tacint_amd65.Rifle_catch", path .. "rifle_catch.wav")
addsound("tacint_AMD65.Buttstock_Lockback", path .. "buttstock_lockback.wav")