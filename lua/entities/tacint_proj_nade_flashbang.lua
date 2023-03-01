AddCSLuaFile()

ENT.Base                     = "tacint_proj_base"
ENT.PrintName                = "Flash Grenade"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/flashbang.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = true // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = false // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = false

ENT.Delay = 2.5

ENT.BounceSounds = {
    "tacint/weapons/grenade/flashbang_bounce-1.wav",
    "tacint/weapons/grenade/flashbang_bounce-2.wav",
    "tacint/weapons/grenade/flashbang_bounce-3.wav",
}

ENT.ExplodeSounds = {
    "tacint/weapons/grenade/flashbang_explode-1.wav",
}

if SERVER then
	util.AddNetworkString("tacintrmc_getflashed")
	util.AddNetworkString("tacintrmc_getstunned")
else
	local fade = (1/8)
	local fcolor = Color( 230, 230, 230 )
	net.Receive("tacintrmc_getflashed", function()
		local ply = LocalPlayer()
		local time = net.ReadFloat()
		assert( time, "Amount of time to be flashed NOT defined" )
		ply:ScreenFade( SCREENFADE.OUT, fcolor, fade, 1 )
		timer.Simple( fade, function()
			ply:ScreenFade( SCREENFADE.IN, fcolor, 2, time )
		end)
	end)
	net.Receive("tacintrmc_getstunned", function()
		local ply = LocalPlayer()
		ply:SetDSP( 37, false )
	end)
end

function ENT:Detonate()
    util.BlastDamage(self, self:GetOwner(), self:GetPos(), 150, 25)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
        self:Remove()
        return
    else
        util.Effect("tacint_flashexplosion", fx)
    end

    local flashorigin = self:GetPos()

    local flashpower = 1024
    local targets = ents.FindInSphere(flashorigin, flashpower)

    for _, k in pairs(targets) do
        if k:IsPlayer() then
            local dist = k:EyePos():Distance(flashorigin)
            local dp = (k:EyePos() - flashorigin):Dot(k:EyeAngles():Forward())

            local time = Lerp( dp, 2.5, 0.25 )

            time = Lerp( dist / flashpower, time, 0 )

            if k:VisibleVec( flashorigin ) then
				net.Start("tacintrmc_getflashed")
					net.WriteFloat(time)
				net.Send(k)
            end
			net.Start("tacintrmc_getstunned")
			net.Send(k)
        end
    end

    self:EmitSound(table.Random(self.ExplodeSounds), 125)

    self:Remove()
end