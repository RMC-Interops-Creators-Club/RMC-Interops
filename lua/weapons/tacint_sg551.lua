SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "SG551"
SWEP.Category = "Tactical Intervention (Arctic)"

SWEP.Description = "Assault rifle with a small magazine but high fire rate and low recoil."

SWEP.ViewModel = "models/weapons/tacint/v_sg551.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_sg551.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 100 / 4 // damage at minimum range
SWEP.Damage_Min = 100 / 6 // damage at maximum range
SWEP.Range_Min = 3500 // distance for which to maintain maximum damage
SWEP.Range_Max = 5500 // distance at which we drop to minimum damage
SWEP.Penetration = 2 // units of metal this weapon can penetrate

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 800

SWEP.Spread = 0.006

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.055 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.1 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.0025 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.002

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.2 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.2
SWEP.RecoilVisualShake = 0.25

SWEP.RecoilKick = 0.35

SWEP.RecoilSpreadPenalty = 0.0045 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.94
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.38 // multiplies how long it takes to recover from sprinting

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

// reload

SWEP.ClipSize = 24
SWEP.Ammo = "ti_556"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/sg551.mdl"
SWEP.DropMagazineImpact = "metal"

// sounds

local path = "tacint/weapons/sg551/sg551_"

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
    },
    ["sights"] = {
        BGs_VM = {
            {2, 1}
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
        Category = {"optic_cqb", "optic_medium"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-5, 0, 5.5),
        Pos_WM = Vector(-0.1, 5, 1.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.5, 0, 23.5),
        Pos_WM = Vector(-0.1, 25, -0.9),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        InstalledElements = {"tactical"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.5, -0.75, 15),
        Pos_WM = Vector(2, 13, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-90, -90 + 3.5, 0),
    },
    [4] = {
        PrintName = "Perk",
        Category = {"foldstock", "perk", "perk_melee", "perk_shooting", "perk_reload"},
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

addsound("tacint_sg551.Remove_Clip", path .. "remove_clip.wav")
addsound("tacint_sg551.Insert_Clip", path .. "insert_clip.wav")
addsound("tacint_sg551.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_sg551.bolt_action", path .. "bolt_action.wav")
addsound("tacint_sg551.bolt_slap", path .. "bolt_slap.wav")
addsound("tacint_sg551.bolt_back", path .. "bolt_back.wav")
addsound("tacint_sg551.throw_catch", path .. "throw_catch.wav")
addsound("tacint_sg551.fire_selector", path .. "fire_selector.wav")