SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "DSA-58"
SWEP.Category = "RMC Interops (Rifles)"

SWEP.Description = "High damage battle rifle with rapid fire rate."

SWEP.ViewModel = "models/weapons/tacint/v_dsa58.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_dsa58.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 2 // damage at minimum range
SWEP.Damage_Min = 100 / 5 // damage at maximum range
SWEP.Range_Min = 1000 // distance for which to maintain maximum damage
SWEP.Range_Max = 1700 // distance at which we drop to minimum damage
SWEP.Penetration = 4 // units of metal this weapon can penetrate

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 700

SWEP.Spread = 0

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.055 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.12 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.024 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0
SWEP.BlindFireSpreadPenalty = 0.035 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.003

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 12
SWEP.RecoilResetTime = 0.5 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.2
SWEP.RecoilVisualShake = 0.55

SWEP.RecoilKick = 1

SWEP.RecoilSpreadPenalty = 0.0085 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.92
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.37 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "ar2"
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

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/dsa58.mdl"
SWEP.DropMagazineImpact = "plastic"

// sounds

local path = "tacint/weapons/dsa58/dsa58_"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "^" .. path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_g3"
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

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "ValveBiped.dsa58_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.6, 0.15, 4),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 6, 0.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.dsa58_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/silencer_on.wav",
        DetachSound = "tacint/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.6, 0.15, 26),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 24, -1.2),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.dsa58_rootbone",
        WMBone = "Box01",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-4.1, -0.75, 15),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(0.75, 14, -0.75),
        Ang_WM = Angle(0, -90, -60),
    },
    [4] = {
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

addsound("tacint_dsa58.insert_clip", path .. "insert_clip.wav")
addsound("tacint_dsa58.insert_clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_dsa58.remove_clip", path .. "remove_clip.wav")
addsound("tacint_dsa58.Handle_FoldDown", path .. "handle_folddown.wav")
addsound("tacint_dsa58.bolt_back", path .. "bolt_back.wav")
addsound("tacint_dsa58.bolt_release", path .. "bolt_shut.wav")