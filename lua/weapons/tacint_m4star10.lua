SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "M1014"
SWEP.Category = "RMC Interops (Heavy Weapons)"

SWEP.Description = "Semi-automatic 12 gauge combat shotgun. Great fire rate but poor control. 6 pellets."

SWEP.ViewModel = "models/weapons/tacint/v_m4star10.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_m4star10.mdl"

SWEP.Slot = 3

// "ballistics"

SWEP.Damage_Max = 100 / 8 // damage at minimum range
SWEP.Damage_Min = 100 / 14 // damage at maximum range
SWEP.Range_Min = 230 // distance for which to maintain maximum damage
SWEP.Range_Max = 420 // distance at which we drop to minimum damage
SWEP.Penetration = 0.25 // units of metal this weapon can penetrate
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

SWEP.RPM = 275

SWEP.Spread = 0

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.08 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.12 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0.095 // spread penalty for not being scoped in
SWEP.BlindFireSpreadPenalty = 0.05 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = 0
SWEP.ScopedSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 5
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 2

SWEP.RecoilKick = 0.25

SWEP.RecoilSpreadPenalty = 0.25 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.92
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.35

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

// reload

SWEP.ClipSize = 7
SWEP.Ammo = "buckshot"
SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1

// sounds

local path = "tacint/weapons/m4star10/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "tacint/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 0 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_m3"
SWEP.EjectEffect = 3

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
        Bone = "ValveBiped._ROOT_Super90",
        InstalledElements = {"sights"},
        AttachSound = "tacint/weapons/optic_on.wav",
        DetachSound = "tacint/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-5.25, 0.2, 8),
        Pos_WM = Vector(11, 1.5, -5.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    -- [2] = {
    --     PrintName = "Muzzle",
    --     Category = "silencer",
    --     Bone = "ValveBiped.bekas_rootbone",
    --     AttachSound = "tacint/weapons/silencer_on.wav",
    --     DetachSound = "tacint/weapons/silencer_off.wav",
    --     Pos_VM = Vector(-2.2, 0, 33),
    --     Pos_WM = Vector(23, 2.5, -2.8),
    --     Ang_VM = Angle(90, 0, 0),
    --     Ang_WM = Angle(0, -3.5, 180),
    -- },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped._ROOT_Super90",
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.25,
        Pos_VM = Vector(-3, 1, 15),
        Pos_WM = Vector(19, 0.25, -3.75),
        Ang_VM = Angle(90, 0, 90),
        Ang_WM = Angle(0, 0, -90),
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

addsound("tacint_fp6.Insertshell",
    {
        "tacint/weapons/fp6/fp6_insertshell-1.wav",
        "tacint/weapons/fp6/fp6_insertshell-2.wav",
        "tacint/weapons/fp6/fp6_insertshell-3.wav",
    }
)
addsound("tacint_Bekas.Movement", "tacint/weapons/bekas/movement-1.wav")
addsound("tacint_M4Star10.Bolt_Back", "tacint/weapons/m4star10/bolt_back.wav")
addsound("tacint_M4Star10.Bolt_release", "tacint/weapons/m4star10/bolt_release.wav")
addsound("tacint_m4.throw_catch", "tacint/weapons/m4/m4_throw_catch.wav")