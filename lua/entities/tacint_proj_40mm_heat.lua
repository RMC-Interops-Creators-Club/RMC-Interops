AddCSLuaFile()

ENT.Base                     = "tacint_proj_base"
ENT.PrintName                = "40mm HEAT"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0

ENT.ExplodeSounds = {
    "^tacint/weapons/grenade/frag_explode-1.wav",
    "^tacint/weapons/grenade/frag_explode-2.wav",
    "^tacint/weapons/grenade/frag_explode-3.wav",
}

ENT.AudioLoop = "tacint/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

function ENT:Detonate()
    if self:WaterLevel() > 0 then self:Remove() return end

    util.BlastDamage(self, self:GetOwner(), self:GetPos(), 150, 25)

    self:EmitSound(table.Random(self.ExplodeSounds), 75)

    local cloud = ents.Create( "tacint_fire_cloud" )

    if !IsValid(cloud) then return end

    local ang = self:GetAngles()

    ang:RotateAroundAxis(ang:Right(), 90)

    cloud:SetPos(self:GetPos())
    cloud:SetAngles(ang)
    cloud:SetOwner(self:GetOwner())
    cloud:Spawn()

    cloud:SetMoveType(MOVETYPE_NONE)

    self:Remove()
end