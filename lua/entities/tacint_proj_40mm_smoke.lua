AddCSLuaFile()

ENT.Base                     = "tacint_proj_base"
ENT.PrintName                = "40mm Smoke"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0

ENT.BounceSounds = {
    "tacint/weapons/grenade/smoke_bounce-1.wav",
    "tacint/weapons/grenade/smoke_bounce-2.wav",
    "tacint/weapons/grenade/smoke_bounce-3.wav",
    "tacint/weapons/grenade/smoke_bounce-4.wav",
}

ENT.ExplodeSounds = {
    "tacint/weapons/grenade/smoke_explode-1.wav",
}

ENT.AudioLoop = "tacint/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

function ENT:Detonate()
    if self:WaterLevel() > 0 then self:Remove() return end

    util.BlastDamage(self, self:GetOwner(), self:GetPos(), 150, 25)

    self:EmitSound(table.Random(self.ExplodeSounds), 75)

    local cloud = ents.Create( "tacint_smoke_cloud" )

    if !IsValid(cloud) then return end

    cloud:SetPos(self:GetPos())
    cloud:Spawn()

    self:Remove()
end