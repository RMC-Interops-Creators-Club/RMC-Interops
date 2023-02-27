SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "KS-23"
SWEP.Category = "RMC Interops (Heavy)"

SWEP.Description = "Heavy shotgun that is lethal up close but damage falls off quickly."

SWEP.ViewModel = "models/weapons/tacint/v_ks23.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_ks23.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 6
SWEP.Damage_Min = 100 / 12
SWEP.Range_Min = 210 // distance for which to maintain maximum damage
SWEP.Range_Max = 320 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate
SWEP.Num = 6

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 47

SWEP.Spread = 0.145

SWEP.ShootTimeMult = 1.25
SWEP.ShootSpeedMult = 1

SWEP.HipFireSpreadPenalty = 0
SWEP.MidAirSpreadPenalty = 0

SWEP.ScopedSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.3
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.4

SWEP.RecoilKick = 2

SWEP.RecoilSpreadPenalty = 0.045 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2

SWEP.SprintToFireTime = 0.4

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.57, 0.5, 0)
SWEP.SightPos = Vector(-3.31, -1, -3.2)

SWEP.CorrectivePos = Vector(0.275, 0, -0.2)
SWEP.CorrectiveAng = Angle(1.21, 0.1, 0)

// reload

SWEP.ClipSize = 4
SWEP.Ammo = "buckshot"
SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1.15

// sounds

local path = "tacint/weapons/bekas/"

SWEP.Sound_Shoot = "^tacint/weapons/fp6/fp6_fire-1.wav"
SWEP.Sound_Shoot_Silenced = "tacint/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 90
SWEP.ShootPitchVariance = 0 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.EjectEffect = 4
SWEP.EjectDelay = 0.5

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
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = {"melee1", "melee2"},
    ["reload"] = {"reload", "reload2"}
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_cqb",
        Bone = "ValveBiped.bekas_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        InstalledElements = {"sights"},
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-3.2, 0, 8),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(9, 0.85, -7),
        Ang_WM = Angle(-25, 3.5, 180),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.bekas_rootbone",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.25,
        Pos_VM = Vector(-1.75, -0.3, 22),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(22, 0, -11),
        Ang_WM = Angle(-25, 3.5, 90),
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

addsound("TacInt_Bekas.Insertshell", path .. "insertshell-1.wav")
addsound("TacInt_Bekas.Movement", path .. "movement-1.wav")
addsound("TacInt_Bekas.PumpBack", path .. "pump_backward-1.wav")
addsound("TacInt_Bekas.PumpForward", path .. "pump_forward-1.wav")