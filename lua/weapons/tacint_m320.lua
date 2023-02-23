SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "M320"
SWEP.Category = "Tactical Intervention (Arctic)"

SWEP.Description = "Grenade launcher capable of firing a variety of payloads."

SWEP.ViewModel = "models/weapons/tacint/v_m320.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_m320.mdl"

SWEP.NoRanger = true

SWEP.Slot = 4

// "ballistics"

SWEP.ShootEnt = "tacint_proj_40mm_he"
SWEP.ShootEntForce = 10000

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

SWEP.Num = 1

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 150

SWEP.Spread = 0.025

SWEP.ShootSpeedMult = 1

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.05 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.20 // spread penalty for being in the air
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

SWEP.RecoilKick = 15

SWEP.RecoilSpreadPenalty = 0.35 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.90
SWEP.ShootingSpeedMult = 0.75 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 0.5
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.35 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, -30)
SWEP.BlindFirePos = Vector(1, -2, -2)

SWEP.SprintAng = Angle(40, -15, 0)
SWEP.SprintPos = Vector(4, 0, -4)

// melee

SWEP.CanMeleeAttack = true

// reload

SWEP.ClipSize = 1
SWEP.Ammo = "ti_40mm"

// sounds

local path = "tacint/weapons/m320/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_m79"

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
    ["blind_idle"] = "idle",
    ["blind_fire"] = "fire",
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
    ["3gl"] = {
        BGs_VM = {
            {2, 1}
        },
    },
    ["buck"] = {
        BGs_VM = {
            {2, 2}
        },
    },
    ["heat"] = {
        BGs_VM = {
            {2, 3}
        },
    },
    ["lvg"] = {
        BGs_VM = {
            {2, 4}
        },
    },
    ["smoke"] = {
        BGs_VM = {
            {2, 5}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Ammo",
        Category = "ammo_40mm",
        AttachSound = "tacint/weapons/m320/shell_in-1.wav",
        DetachSound = "tacint/weapons/m320/shell_out-1.wav",
    },
    [2] = {
        PrintName = "Perk",
        Category = {"foldstock", "perk", "perk_reload", "perk_blindfire", "perk_melee"},
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

addsound("tacint_m320.Tube_Open", path .. "tube_open-1.wav")
addsound("tacint_m320.Tube_close", path .. "tube_close-1.wav")
addsound("tacint_m320.shell_out", path .. "shell_out-1.wav")
addsound("tacint_m320.shell_in", path .. "shell_in-1.wav")
addsound("tacint_m320.buttstock_back", path .. "buttstock_back-1.wav")
addsound("tacint_m320.sight_flipup", path .. "sight_flipup-1.wav")