SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "M4 Carbine"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "Venerable 5.56 NATO assault rifle. This is the older variant with 3-round burst for improved control."

SWEP.ViewModel = "models/weapons/tacint_extras/v_m4a1.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_m4a1.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 100 / 4
SWEP.Damage_Min = 100 / 6
SWEP.Range_Min = 1150 // distance for which to maintain maximum damage
SWEP.Range_Max = 2100
SWEP.Penetration = 2 // units of metal this weapon can penetrate

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = -3

SWEP.RPM = 850

SWEP.Spread = 0.004
SWEP.HipFireSpreadPenalty = 0.0015 // spread penalty for not being scoped in
SWEP.MoveSpreadPenalty = 0.05 // spread penalty while travelling at max. 250 u/s

SWEP.ShootTimeMult = 0.5


SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 0.5 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.24

SWEP.RecoilKick = 0.8

SWEP.RecoilSpreadPenalty = 0.008

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.96
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2

SWEP.SprintToFireTime = 0.35 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.1, 0, 0)
SWEP.SightPos = Vector(-4.154, -7.5, -4.45)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

// reload

SWEP.ClipSize = 30
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/m4.mdl"
SWEP.DropMagazineImpact = "metal"

// sounds

local path = "Tacint/weapons/m4/m4_"
local path2 = "tacint_extras/m4a1/m4a1_"

SWEP.Sound_Shoot = "^" .. path2 .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path2 .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
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
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {2, 1}
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
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.5, -0.05, 4),
        Pos_WM = Vector(0.75, 3, 1.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.95, 0, 25),
        Pos_WM = Vector(1.4, 26, -0.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.9, -1.2, 13.5),
        Pos_WM = Vector(2, 13, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-90, -90 + 3.5, 0),
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

addsound("tacint_extras_m4a1.Remove_Clip", path2 .. "clipout.mp3")
addsound("tacint_extras_m4a1.Insert_Clip", path2 .. "clipin.mp3")
addsound("tacint_extras_m4a1.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_extras_m4a1.bolt_action", path .. "bolt_action.wav")
addsound("tacint_extras_m4a1.bolt_slap", path .. "bolt_slap.wav")
addsound("tacint_extras_m4a1.throw_catch", path .. "throw_catch.wav")