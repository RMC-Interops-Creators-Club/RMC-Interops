SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "USP Tactical"
SWEP.Category = "RMC Interops (Handguns)"

SWEP.Description = "Modern .45 ACP pistol with a double stack magazine."

SWEP.ViewModel = "models/weapons/tacint_extras/v_usp.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_usp.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 30
SWEP.Damage_Min = 12 // 100 / 7 // damage at maximum range
SWEP.Range_Min = 500 // distance for which to maintain maximum damage
SWEP.Range_Max = 810 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate

SWEP.MuzzleVelocity = 12000

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

SWEP.RPM = 400

SWEP.Spread = 0.0035

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 8
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 8
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.06
SWEP.RecoilKick = 0.35

SWEP.RecoilSpreadPenalty = 0.0045

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2

SWEP.SprintToFireTime = 0.2

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

SWEP.SightAng = Angle(-0.01, 0.14, 0)
SWEP.SightPos = Vector(-3.48, 0, -3.5)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)


// reload

SWEP.ClipSize = 12
SWEP.Ammo = "ti_45acp"

SWEP.ReloadTimeMult = 1.3

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/p2000.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint_extras/usp/"

SWEP.Sound_Shoot = "^" .. path .. "Fire.wav"
SWEP.Sound_Shoot_Silenced = path .. "Supressed.wav"

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
    ["fire_iron"] = "new_shoot1",
    ["fire"] = "new_shoot1", // {"shoot1", "shoot2", "shoot3"},
    ["lastshot"] = "new_lastshot",
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.NoIdle = false

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true

// attachments

SWEP.AttachmentElements = {
    ["pistol_comp"] = {
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
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1.2,
        Pos_VM = Vector(0, 0, -0.2),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0, -1, -0.8),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"comp_usp", "silencer"},
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-0.5, 0.39, 7),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8.5, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0, 6),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -3),
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

addsound("tacint_extras_usp.clip_in", path .. "clipin.wav")
addsound("tacint_extras_usp.clip_in-mid", path .. "clipin.wav")
addsound("tacint_extras_usp.clip_out", path .. "clipout.wav")

addsound("tacint_extras_usp.slide_action", path .. "SlideBack.wav")

addsound("tacint_extras_usp.slide_open", path .. "magshove.mp3")
addsound("tacint_extras_usp.slide_shut", path .. "boltrelease.wav")