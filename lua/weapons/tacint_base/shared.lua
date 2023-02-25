// spawnable
SWEP.Spawnable = false
SWEP.AdminOnly = false

// names and stuff
SWEP.PrintName = "Arctic's Tactical Intervention Base"
SWEP.Category = "Tactical Intervention (Arctic)"

SWEP.Description = ""

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.ViewModelFOV = 60

SWEP.NoRanger = false
SWEP.NoStatBox = false

SWEP.NPCUsable = true

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 30 // damage at minimum range
SWEP.Damage_Min = 20 // damage at maximum range
SWEP.Range_Min = 256 // distance for which to maintain maximum damage
SWEP.Range_Max = 1024 // distance at which we drop to minimum damage
SWEP.Penetration = 0 // units of metal this weapon can penetrate

SWEP.ShootEnt = false
SWEP.ShootEntForce = 10000

SWEP.Num = 1
SWEP.TracerNum = 1
SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1.25,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

// Firemode system works just like ArcCW
// 2 = full auto
// 1 = semi auto
// 0 = safe
// negative numbers = burst
SWEP.Firemode = 2
SWEP.RunawayBurst = false // continue firing until burst is completely expended
SWEP.PostBurstDelay = 0 // only applies to runaway burst guns
SWEP.AutoBurst = false // hold the trigger to keep firing burst after burst

SWEP.ShootSpeedMult = 0.5

SWEP.RPM = 600

SWEP.Spread = 0.01

// Spread penalties are in spread units and are additive
SWEP.MoveSpreadPenalty = 0.1 // spread penalty while travelling at max. 250 u/s
SWEP.MidAirSpreadPenalty = 0.1 // spread penalty for being in the air
SWEP.HipFireSpreadPenalty = 0 // spread penalty for not being scoped in
SWEP.ScopedSpreadPenalty = 0 // spread penalty for... being scoped in?
SWEP.BlindFireSpreadPenalty = 0.1 // spread penalty for blind firing
SWEP.CrouchSpreadPenalty = -0.02

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.25 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 2
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.1
SWEP.RecoilVisualShake = 0.1

SWEP.RecoilKick = 0.25
SWEP.RecoilSideKick = 0.1

SWEP.RecoilSpreadPenalty = 0.001 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.99
SWEP.ShootingSpeedMult = 1 // slow down applied while shooting
SWEP.SightedSpeedMult = 0.5
SWEP.MeleeSpeedMult = 0.5
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.ShootWhileSprint = false
SWEP.SprintToFireTime = 0.25 // how long it takes to go from sprinting to shooting

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeCustomize = "slam"
SWEP.HoldTypeNPC = nil

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, 0)

SWEP.SprintAng = Angle(0, 45, 0)
SWEP.SprintPos = Vector(0, 0, 0)

SWEP.BlindFireAng = Angle(0, 15, 0)
SWEP.BlindFirePos = Vector(0, 0, -6)

SWEP.CustomizeAng = Angle(30, 15, 0)
SWEP.CustomizePos = Vector(5, 0, -6)

// scope

SWEP.Scope = false
SWEP.ScopeOverlay = nil // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 8
SWEP.ScopeLevels = 2 // 2 = like CS:S
SWEP.ScopeHideWeapon = true

SWEP.QuickScopeSpreadPenalty = 0.1
SWEP.QuickScopeTime = 0.1 // amount of time over which to fade out the quickscope spread penalty

// quicknade

SWEP.CanQuickNade = true
SWEP.QuickNadeTimeMult = 1

// melee

SWEP.CanMeleeAttack = true
SWEP.MeleeDamage = 25
SWEP.MeleeAttackTime = 0.75 // time between swings

// reload

SWEP.AmmoPerShot = 1
SWEP.ClipSize = 30
SWEP.Ammo = "pistol"

SWEP.AmmoToHL2Translate = {
    ["ti_flashbang"] = "grenade",
    ["ti_thermite"] = "grenade",
    ["ti_smoke"] = "grenade",
    ["ti_c4"] = "slam",
    ["ti_gas"] = "grenade",
    ["ti_9mm"] = "pistol",
    ["ti_45acp"] = "pistol",
    ["ti_12g"] = "buckshot",
    ["ti_556"] = "smg1",
    ["ti_357"] = "357",
    ["ti_rpg7"] = "rpg_round",
    ["ti_40mm"] = "smg1_grenade",
    ["ti_32acp"] = "pistol",
    ["ti_50bmg"] = "sniperpenetratedround",
    ["ti_308"] = "ar2",
    ["ti_762nato"] = "ar2",
    ["ti_762wp"] = "ar2",
    ["ti_47mm"] = "smg1",
    ["ti_57mm"] = "smg1"
}

SWEP.SupplyAmmoType = false // overrides clipsize/ammo for ammo pickups
SWEP.SupplyAmmoAmount = false

SWEP.TryUnholster = false // if we have an "unholster" animation use it instead of "deploy"

SWEP.ShotgunReload = false
SWEP.ShotgunThreeload = true // use those stupid 3 shot reload animations
SWEP.ReloadTimeMult = 1
SWEP.DeployTimeMult = 1
SWEP.DropMagazineModel = false
SWEP.DropMagazineImpact = "pistol" // available: "pistol", "plastic", "metal", "bullet", "shotgun"
SWEP.DropMagazineAmount = 1

SWEP.DefaultBodygroups = "0000000"
SWEP.DefaultWMBodygroups = "0000000"
SWEP.BulletBodygroups = nil
/*
{
    [1] = {5, 1}
}
*/
SWEP.LoadInTime = 0.25 // how long to replenish the visible "belt" of ammo

// sounds

SWEP.Sound_Shoot = "^"
SWEP.Sound_Shoot_Silenced = ""

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

SWEP.Sound_ScopeIn = "weapons/zoom.wav"
SWEP.Sound_MeleeAttack = ""
SWEP.Sound_DryFire = "tacint/weapons/dryfire_pistol-1.wav"

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_pistol"

SWEP.EjectEffect = 1 // 1 = pistol, 2 = rifle, 3 = shotgun
SWEP.EjectDelay = 0

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
    ["melee"] = {"melee1", "melee2"}
} // translates ["fire"] = "shoot"; key = translates from, value = translates to
// e.g. you have a "shoot1" sequence and need "fire"
// so ["fire"] = "shoot1"
// can be ["fire"] = {"list", "of", "values"}

SWEP.LastShot = false
SWEP.Akimbo = false

// attachments

SWEP.AttachmentElements = {
    ["bg_name"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    }
}

SWEP.Attachments = nil
-- {
--     [1] = {
--         Installed = nil,
--         Default = nil, // install this attachment by default
--         InstalledElements = "", // single or list of elements to activate when something is installed here
--         UnInstalledElements = "",
--         Integral = false, // cannot be removed
--         Category = "", // single or {"list", "of", "values"}
--         Bone = "",
--         WMBone = "",
--         Pos_VM = Vector(0, 0, 0),
--         Pos_WM = Vector(0, 0, 0),
--         Ang_VM = Angle(0, 0, 0),
--         Ang_WM = Angle(0, 0, 0),
--         CapacityMult = 1, // multiply the amount of Capacity this attachment occupies
--     }
-- }

SWEP.AttachmentCapacity = 30 // amount of "Capacity" this gun can accept

SWEP.CrosshairDirs = {
    {-1, 0},
    {1, 0},
    {0, -1},
    {0, 1}
}

// boilerplate

SWEP.ArcticTacInt = true
SWEP.DrawCrosshair = true
SWEP.AccurateCrosshair = true
SWEP.DrawWeaponInfoBox = false
SWEP.UseHands = true

SWEP.CurrentAnimation = ""

SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize = 0
SWEP.Primary.Ammo = ""
SWEP.Primary.DefaultClip = 0

SWEP.Secondary.Automatic = false
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.Ammo = ""

SWEP.GaveDefaultAmmo = false

SWEP.BounceWeaponIcon = false

SWEP.SwayScale = 1
SWEP.BobScale = 1

AddCSLuaFile()

local searchdir = "weapons/tacint_base"

local function autoinclude(dir)
    local files, dirs = file.Find(searchdir .. "/*.lua", "LUA")

    for _, filename in pairs(files) do
        if filename == "shared.lua" then continue end
        local luatype = string.sub(filename, 1, 2)

        if luatype == "sv" then
            if SERVER then
                include(dir .. "/" .. filename)
            end
        elseif luatype == "cl" then
            AddCSLuaFile(dir .. "/" .. filename)
            if CLIENT then
                include(dir .. "/" .. filename)
            end
        else
            AddCSLuaFile(dir .. "/" .. filename)
            include(dir .. "/" .. filename)
        end
    end

    for _, path in pairs(dirs) do
        autoinclude(dir .. "/" .. path)
    end
end

autoinclude(searchdir)

function SWEP:SetupDataTables()
    self:NetworkVar("Float", 0, "RecoilAmount")
    self:NetworkVar("Float", 1, "AnimLockTime")
    self:NetworkVar("Float", 2, "NextIdle")
    self:NetworkVar("Float", 3, "LastRecoilTime")
    self:NetworkVar("Float", 4, "RecoilDirection")
    self:NetworkVar("Float", 5, "SprintAmount")
    self:NetworkVar("Float", 6, "SprintLockTime")
    self:NetworkVar("Float", 7, "LastScopeTime")
    self:NetworkVar("Float", 8, "LastMeleeTime")
    self:NetworkVar("Float", 9, "PrimedGrenadeTime")
    self:NetworkVar("Float", 10, "StartPrimedGrenadeTime")
    self:NetworkVar("Float", 11, "ReloadFinishTime")

    self:NetworkVar("Int", 0, "BurstCount")
    self:NetworkVar("Int", 1, "ScopeLevel")
    self:NetworkVar("Int", 2, "NthShot")
    self:NetworkVar("Int", 3, "LoadedRounds")

    self:NetworkVar("Bool", 0, "Customize")
    self:NetworkVar("Bool", 1, "Reloading")
    self:NetworkVar("Bool", 2, "BlindFire")
    self:NetworkVar("Bool", 3, "EndReload")
    self:NetworkVar("Bool", 4, "PrimedGrenade")
end