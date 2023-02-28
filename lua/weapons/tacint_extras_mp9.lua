SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "MP9"
SWEP.Category = "RMC Interops (Small Arms)"

// Assets: https://gamebanana.com/mods/208831

SWEP.Description = "Premium submachine gun with a fast fire rate."

SWEP.ViewModel = "models/weapons/tacint_extras/v_mp9.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_mp9.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 20
SWEP.Damage_Min = 9
SWEP.Range_Min = 750 // distance for which to maintain maximum damage
SWEP.Range_Max = 1900 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1.25,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.RPM = 900

SWEP.Spread = 0.011

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 15
SWEP.RecoilResetTime = 0.15 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.02

SWEP.RecoilKick = 0.25

SWEP.RecoilSpreadPenalty = 0.006

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2

SWEP.SprintToFireTime = 0.2

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

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(-3.25, -4, -2.9)

SWEP.CorrectivePos = Vector(0.04, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 30
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/mp9.mdl"
SWEP.DropMagazineImpact = "plastic"
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

// sounds

local path = "tacint/weapons/mp7/mp7_"
local path2 = "tacint_extras/mp9/"

SWEP.Sound_Shoot = "^" .. path2 .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path2 .. "fire_silenced-1.wav"

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
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"},
    ["deploy"] = "deploy",
}

// attachments

SWEP.DeployTimeMult = 1

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["rail"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_smg", "optic_cqb", "optic_medium"},
        Bone = "ValveBiped.mp7_rootbone",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-4.25, 0.05, 2),
        Pos_WM = Vector(5, 1.5, -6),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.mp7_rootbone",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.75, 0.1, 13),
        Pos_WM = Vector(18, 2, -4.25),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.mp7_rootbone",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"rail"},
        Pos_VM = Vector(-3, 0.8, 4),
        Pos_WM = Vector(8, 0.6, -4.5),
        Ang_VM = Angle(90, 0, 90),
        Ang_WM = Angle(0, -3.5, -90),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"foldstock", "perk", "perk_melee", "perk_shooting", "perk_reload", "perk_hollowpoints"},
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

addsound("tacint_extras_mp9.remove_clip", path2 .. "clipout.mp3")
addsound("tacint_extras_mp9.insert_clip", path2 .. "clipin.mp3")
addsound("tacint_extras_mp9.bolt_action", path .. "bolt_action.wav")
addsound("tacint_extras_mp9.forearm_deploy", "tacint/weapons/uzi/" .. "foldingstock_back.wav")