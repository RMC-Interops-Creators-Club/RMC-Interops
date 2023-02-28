SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Ultima Ratio"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "Premium bolt action sniper rifle with excellent handling."

SWEP.ViewModel = "models/weapons/tacint/v_uratio.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_uratio.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 3 // damage at minimum range
SWEP.Damage_Min = 100 / 2 // damage at maximum range
SWEP.Range_Min = 2120 // distance for which to maintain maximum damage
SWEP.Range_Max = 3450 // distance at which we drop to minimum damage
SWEP.Penetration = 6 // units of metal this weapon can penetrate
SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.8
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 38

SWEP.Spread = 0

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.22 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.22 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.25 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.01
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.005

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 0.5
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 0.2

SWEP.RecoilKick = 5

SWEP.RecoilSpreadPenalty = 0.25 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.90
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.42 // multiplies how long it takes to recover from sprinting

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
SWEP.ScopeFOV = 90 / 10
SWEP.ScopeLevels = 2 // 2 = like CS:S

SWEP.QuickScopeSpreadPenalty = 0.1
SWEP.QuickScopeTime = 0.4 // amount of time over which to fade out the quickscope spread penalty

// reload

SWEP.ClipSize = 10
SWEP.Ammo = "ti_308"

SWEP.ReloadTimeMult = 1.12
SWEP.DropMagazineImpact = "metal"
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl"

// sounds

local path = "tacint/weapons/uratio/uratio_"

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
SWEP.EjectDelay = 0.9

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
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["optic"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["irons"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights", "optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "Box01",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-5.5, 0, 5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 5, 2),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        WMBone = "Box01",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-4.1, 0, 30),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 35, 0.25),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        WMBone = "Box01",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-2.5, 0, 17),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 19.5, -1.5),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"perk", "foldstock", "perk_melee", "perk_shooting", "perk_reload"},
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

addsound("tacint_uratio.Clip_Out", path .. "clip_out.wav")
addsound("tacint_uratio.Clip_In", path .. "clip_in.wav")
addsound("tacint_uratio.Bolt_Back", path .. "bolt_back.wav")
addsound("tacint_uratio.bolt_forward", path .. "bolt_forward.wav")
addsound("tacint_uratio.safety", path .. "safety.wav")
addsound("tacint_uratio.buttstock_back", path .. "buttstock_back.wav")
addsound("tacint_uratio.buttstock_rest_down", path .. "buttstock_rest_down.wav")
addsound("tacint_uratio.flip_up_cover", path .. "flip_up_cover.wav")