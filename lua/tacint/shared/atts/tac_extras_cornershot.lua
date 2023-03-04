ATT.PrintName = "Blind-Cam"
ATT.FullName = "Tactical Blindspot Targeting Camera"
ATT.Icon = Material("entities/tacrp_att_tac_extras_cornershot.png", "mips smooth")
ATT.Description = "Tactical camera that allows the user to see over cover when blindfiring."
ATT.Pros = {"Display blindfire aim"}
ATT.Cons = {"Visible glare from lens", "Reduced handling"}

ATT.Model = "models/weapons/tacint/addons/cornershot_mounted.mdl"
ATT.Scale = 1

ATT.BlindFireCamera = true
ATT.Category = "tactical" // can be "string" or {"list", "of", "strings"}

if CLIENT then
	local TacIntRMCOverDraw = false

	hook.Add("PreRender", "TACRP_PreRender", function()
		local wpn = LocalPlayer():GetActiveWeapon()
	
		if !wpn.ArcticTacInt then return end
	
		if wpn:GetValue("BlindFireCamera") then
			tacint_dort(wpn)
		end
	end)

	local rt_w = 426
	local rt_h = 240

	local rtmat = GetRenderTarget("tacintrmc_pipscope", rt_w, rt_h, false)

	local lastblindfire = false
	local blindfiretime = 0

	local csm_boot_1 = Material("tacint/tacrpport/cornershot_boot_1.png", "mips smooth")
	local csm_boot_2 = Material("tacint/tacrpport/cornershot_boot_2.png", "mips smooth")
	local csm_boot_3 = Material("tacint/tacrpport/cornershot_boot_3.png", "mips smooth")

	local csm_1 = Material("tacint/tacrpport/cornershot_1.png", "mips smooth")
	local csm_2 = Material("tacint/tacrpport/cornershot_2.png", "mips smooth")

	local noise1 = Material("tacint/tacrpport/noise1.png")
	local noise2 = Material("tacint/tacrpport/noise2.png")
	local noise3 = Material("tacint/tacrpport/noise3.png")
	local noise4 = Material("tacint/tacrpport/noise4.png")

	local noisemats = {
		noise1,
		noise2,
		noise3,
		noise4
	}

	local lastrendertime = 0

	local fps = 30

	function tacint_dort(self)
		if !self:GetBlindFire() then lastblindfire = false return end
		if TacIntRMCOverDraw then return end

		if !lastblindfire then
			blindfiretime = 0
		end

		if lastrendertime > CurTime() - (1 / fps) then return end

		local rt = {
			x = 0,
			y = 0,
			w = rt_w,
			h = rt_h,
			aspect = 1,
			angles = self:GetShootDir(),
			origin = self:GetMuzzleOrigin(),
			drawviewmodel = false,
			fov = 40,
		}

		render.PushRenderTarget(rtmat, 0, 0, rt_w, rt_h)

		if blindfiretime >= 1 or blindfiretime == 0 then
			TacIntRMCOverDraw = true
			render.RenderView(rt)
			TacIntRMCOverDraw = false
		end

		DrawColorModify({
			["$pp_colour_addr"] = 0.25 * 132 / 255,
			["$pp_colour_addg"] = 0.25 * 169 / 255,
			["$pp_colour_addb"] = 0.25 * 154 / 255,
			["$pp_colour_brightness"] = 0.2,
			["$pp_colour_contrast"] = 0.85,
			["$pp_colour_colour"] = 0.95,
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		})

		cam.Start2D()

		if blindfiretime < 1 then
			if blindfiretime < 0.75 then
				surface.SetDrawColor(255, 255, 255)
				surface.SetMaterial(noisemats[math.random(#noisemats)])
				surface.DrawTexturedRect(0, 0, rt_w, rt_h)
			else
				surface.SetDrawColor(0, 0, 0)
				surface.DrawRect(0, 0, rt_w, rt_h)
			end

			DrawColorModify({
				["$pp_colour_addr"] = 0.25 * 132 / 255,
				["$pp_colour_addg"] = 0.25 * 169 / 255,
				["$pp_colour_addb"] = 0.25 * 154 / 255,
				["$pp_colour_brightness"] = 0.2,
				["$pp_colour_contrast"] = 0.85,
				["$pp_colour_colour"] = 0.95,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			})
		end

		if blindfiretime < 0.2 then
			surface.SetMaterial(csm_boot_1)
		elseif blindfiretime < 0.4 then
			surface.SetMaterial(csm_boot_2)
		elseif blindfiretime < 0.6 then
			surface.SetMaterial(csm_boot_3)
		else
			if math.sin(CurTime() * 3) > 0.5 then
				surface.SetMaterial(csm_1)
			else
				surface.SetMaterial(csm_2)
			end
		end

		surface.SetDrawColor(255, 255, 255)
		surface.DrawTexturedRect(0, 0, rt_w, rt_h)
		cam.End2D()

		render.PopRenderTarget()

		blindfiretime = blindfiretime + (math.random(0, 5) * math.random(0, 5) * (1 / fps) / 6.25)

		lastblindfire = true
		lastrendertime = CurTime()
	end

	ATT.Hook_DrawHUD = function(self)
		if !self:GetBlindFire() then lastblindfire = false return end

		local w = ScreenScale(640 / 4)
		local h = ScreenScale(480 / 4)
		local x = (ScrW() - w) / 2
		local y = (ScrH() - h) / 2
		y = y + (ScrH() / 4)
		render.DrawTextureToScreenRect(rtmat, x, y, w, h)
	end
end