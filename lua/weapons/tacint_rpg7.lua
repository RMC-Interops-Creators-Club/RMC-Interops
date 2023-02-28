SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "RPG-7"
SWEP.Category = "RMC Interops (Utilities)"

SWEP.Description = "Soviet rocket launcher with powerful explosion."

SWEP.ViewModel = "models/weapons/tacint/v_rpg7.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_rpg7.mdl"

SWEP.NoRanger = true

SWEP.Slot = 4

// "ballistics"

SWEP.ShootEnt = "tacint_proj_rpg7"
SWEP.ShootEntForce = 10000

SWEP.Num = 1

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 150

SWEP.Spread = 0.025

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.25 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.45 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = -0.02
SWEP.BlindFireSpreadPenalty = 0 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.015

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 5
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.05
SWEP.RecoilVisualShake = 0.2

SWEP.RecoilKick = 10

SWEP.RecoilSpreadPenalty = 0.35 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.25 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.45 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "rpg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, 0)
SWEP.BlindFirePos = Vector(1, -2, 0)

SWEP.SprintAng = Angle(40, -15, 0)
SWEP.SprintPos = Vector(4, 0, -4)

// melee

SWEP.CanMeleeAttack = false

// reload

SWEP.ClipSize = 1
SWEP.Ammo = "rpg_round"

SWEP.BulletBodygroups = {
    [1] = {5, 1}
}

// sounds

local path = "tacint/weapons/rpg7/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"

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
    ["blind_fire"] = "aimed_fire",
    ["blind_idle"] = "aimed_idle",
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Perk",
        Category = {"perk", "perk_reload", "perk_blindfire"},
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

addsound("tacint_rpg7.jingle", path .. "handling-1.wav")
addsound("tacint_rpg7.insert_rocket", path .. "insert_rocket.wav")
addsound("tacint_rpg7.flipup_sight", path .. "flipup_sight.wav")