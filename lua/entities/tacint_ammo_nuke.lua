AddCSLuaFile()

ENT.Type                     = "anim"
ENT.Base                     = "base_entity"
ENT.RenderGroup              = RENDERGROUP_TRANSLUCENT

ENT.PrintName                = "Nuclear Device"
ENT.Category                 = "RMC Interops - Ammo"

ENT.AdminOnly                = true
ENT.Spawnable                = true
ENT.Model                    = "models/weapons/tacint/props_misc/briefcase_bomb-1.mdl"

function ENT:Initialize()
    self:SetModel(self.Model)

    if SERVER then

        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetUseType(SIMPLE_USE)
        self:PhysWake()

        self:SetTrigger(true) -- Enables Touch() to be called even when not colliding
        self:UseTriggerBounds(true, 24)
    end
end

function ENT:ApplyAmmo(ply)
    if self.Used then return end

    self.Used = true
    ply:GiveAmmo(1, "ti_nuke")
    self:Remove()
end

ENT.CollisionSoundsHard = {
    "physics/metal/metal_box_impact_hard1.wav",
    "physics/metal/metal_box_impact_hard2.wav",
    "physics/metal/metal_box_impact_hard3.wav",
}

ENT.CollisionSoundsSoft = {
    "physics/metal/metal_box_impact_soft1.wav",
    "physics/metal/metal_box_impact_soft2.wav",
    "physics/metal/metal_box_impact_soft3.wav",
}

function ENT:PhysicsCollide(data)
    if data.DeltaTime < 0.1 then return end

    if data.Speed > 25 then
        self:EmitSound(self.CollisionSoundsHard[math.random(#self.CollisionSoundsHard)])
    else
        self:EmitSound(self.CollisionSoundsSoft[math.random(#self.CollisionSoundsSoft)])
    end
end

if SERVER then

    function ENT:Use(ply)
        if !ply:IsPlayer() then return end
        self:ApplyAmmo(ply)
    end

elseif CLIENT then

    function ENT:DrawTranslucent()
        self:Draw()
    end

    function ENT:Draw()
        self:DrawModel()
    end

end