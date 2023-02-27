ATT.PrintName = "Radar"
ATT.FullName = "Tactical Omnidirectional Radar Microphone"
ATT.Icon = Material("entities/tacrp_att_tac_extras_dmic.png", "mips smooth")
ATT.Description = "Tactical microphone that shows nearby enemies via echolocation."
ATT.Pros = {"Radar"}
ATT.Cons = {"Audible pinging", "Reduced handling"}

ATT.Model = "models/weapons/tacint/addons/dmic_mounted.mdl"
ATT.Scale = 0.75
ATT.ModelOffset = Vector(-0.25, 0, 0)

ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

ATT.CanToggle = true

if CLIENT then
	local mat_radar = Material("tacint/tacrpport/radar.png", "smooth")
	local mat_radar_active = Material("tacint/tacrpport/radar_active.png", "mips smooth")
	local mat_dot = Material("tacint/tacrpport/dot.png", "mips smooth")
	local lastradar = 0
	local scantime = 1.5

	ATT.Hook_DrawHUD = function(self)
		if self:GetTactical() then
			local scrw = ScrW()
			local scrh = ScrH()

			local w = ScreenScale(100)
			local h = ScreenScale(100)

			local x = ScreenScale(25)
			local y = ScreenScale(25)

			surface.SetMaterial(mat_radar)
			surface.SetDrawColor(255, 255, 255, 100)
			surface.DrawTexturedRect(x, y, w, h)

			local radarpositions = {}

			if lastradar + scantime > CurTime() then
				radarpositions = cache_lastradarpositions
			else
				local tbl = ents.FindInSphere(self:GetOwner():GetPos(), 25 / TacInt.HUToM)

				for _, ent in ipairs(tbl) do
					if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then continue end
					if ent == self:GetOwner() then continue end

					local ang = self:GetOwner():EyeAngles()

					ang.y = ang.y + 90
					ang.p = 0
					ang.r = 0

					local relpos = WorldToLocal(ent:GetPos(), Angle(0, 0, 0), self:GetOwner():GetPos(), ang)

					local read = {
						x = -relpos.x,
						y = relpos.y,
					}

					table.insert(radarpositions, read)
				end

				lastradar = CurTime()
				cache_lastradarpositions = radarpositions
			end

			surface.SetDrawColor(0, 0, 0, 255 * 2 * (1 - ((CurTime() - lastradar) / scantime)))
			surface.SetMaterial(mat_radar_active)
			surface.DrawTexturedRect(x, y, w, h)
			-- surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(mat_dot)

			local ds = ScreenScale(4)

			for _, dot in ipairs(radarpositions) do
				local dx = x + (dot.x * TacInt.HUToM * w * (360 / 400) / (25 * 2)) + (w / 2)
				local dy = y + (dot.y * TacInt.HUToM * h * (360 / 400) / (25 * 2)) + (h / 2)

				local gs = ScreenScale(8)

				dx = math.Round(dx / (w / gs)) * (w / gs)
				dy = math.Round(dy / (h / gs)) * (h / gs)

				dx = dx - ScreenScale(0.5)
				dy = dy - ScreenScale(0.5)

				surface.DrawTexturedRect(dx - (ds / 2), dy - (ds / 2), ds, ds)
			end
		end
	end
end