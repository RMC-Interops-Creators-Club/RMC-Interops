AddCSLuaFile()

ENT.Base                     = "tacint_proj_base"
ENT.PrintName                = "Thermite Grenade"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/smoke.mdl"

ENT.Material = "models/tacint/weapons/w_models/smoke/thermite-1"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = true // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = false // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 5

ENT.ExplodeSounds = {
    "tacint/weapons/grenade/frag_explode-1.wav",
    "tacint/weapons/grenade/frag_explode-2.wav",
    "tacint/weapons/grenade/frag_explode-3.wav",
}

function ENT:Detonate()
    if self:WaterLevel() > 0 then self:Remove() return end

    util.BlastDamage(self, self:GetOwner(), self:GetPos(), 150, 25)

    self:EmitSound(table.Random(self.ExplodeSounds), 75)

    local cloud = ents.Create( "tacint_fire_cloud" )

    if !IsValid(cloud) then return end

    cloud:SetPos(self:GetPos())
    cloud:SetAngles(self:GetAngles())
    cloud:SetOwner(self:GetOwner())
    cloud:Spawn()

    self:Remove()
end

ENT.NextDamageTick = 0