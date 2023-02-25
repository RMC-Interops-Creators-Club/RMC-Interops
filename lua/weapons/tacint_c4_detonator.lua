SWEP.Base = "tacint_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "C4 Detonator"
SWEP.Category = "Tactical Intervention (Arctic)"

SWEP.Description = "Device for touching off C4 charges or other types of remote explosives."

SWEP.ViewModel = "models/weapons/tacint/v_c4.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_c4_det.mdl"

SWEP.NoRanger = true
SWEP.NoStatBox = true

SWEP.Slot = 4

SWEP.NPCUsable = false

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 120

SWEP.CanBlindFire = false

SWEP.Ammo = ""
SWEP.ClipSize = -1

SWEP.SupplyAmmoType = "ti_c4"
SWEP.SupplyAmmoAmount = 3

// handling

SWEP.MoveSpeedMult = 1

SWEP.MeleeSpeedMult = 1
SWEP.MeleeSpeedMultTime = 2 // seconds to apply slow down for

SWEP.SprintToFireTime = 0.25

// hold types

SWEP.HoldType = "normal"
SWEP.HoldTypeSprint = "normal"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -12)

// sounds

local path = "tacint/weapons/c4/"

SWEP.AnimationTranslationTable = {
    ["deploy"] = "deploy",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee"},
        AttachSound = "tacint/weapons/flashlight_on.wav",
        DetachSound = "tacint/weapons/flashlight_off.wav",
        CapacityMult = 1, // multiply the amount of Capacity this attachment occupies
    },
}

SWEP.AttachmentCapacity = 30 // amount of "Capacity" this gun can accept

SWEP.DrawCrosshair = false

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_C4_Detonator.Detonator_Press", path .. "detonator_press.wav")
addsound("tacint_C4_Detonator.antenna_open", path .. "antenna_open.wav")

function SWEP:PrimaryAttack()
    if self:GetValue("CanQuickNade") then
        if self:GetOwner():KeyDown(IN_USE) then
            self:PrimeGrenade()
            return
        end
    end

    if self:StillWaiting() then return end

    self:SetBaseSettings()

    self:PlayAnimation("detonate")

    for i, k in pairs(ents.FindByClass("tacint_proj_nade_*")) do
        if k:GetOwner() == self:GetOwner() and k.RemoteFuse then
            k:RemoteDetonate()
        end
    end

    self:SetNextPrimaryFire(CurTime() + (60 / self:GetValue("RPM")))
end

function SWEP:GiveDefaultAmmo()
    self:GetOwner():GiveAmmo(1, "ti_c4")
end