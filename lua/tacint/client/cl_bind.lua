hook.Add("PlayerBindPress", "TacInt_Binds", function(ply, bind, pressed, code)
	local wpn = ply:GetActiveWeapon()

	if !wpn or !IsValid(wpn) or !wpn.ArcticTacInt then return end

	if !pressed then return end

	if bind == "+zoom" then
		if !LocalPlayer():KeyDown(IN_USE) then
			net.Start("tacint_toggleblindfire")
			net.WriteBool(!wpn:GetBlindFire())
			net.SendToServer()

			return true
		end
	end

	if bind == "+menu_context" then
		if !LocalPlayer():KeyDown(IN_USE) then
			net.Start("tacint_togglecustomize")
			net.WriteBool(!wpn:GetCustomize())
			net.SendToServer()
			return true
		end
	end

	if true--[[GetConVar("tacrp_toggletactical"):GetBool()]] and bind == "impulse 100" and wpn:GetValue("CanToggle") then
		net.Start("tacintrmc_toggletactical")
		net.SendToServer()
		wpn:SetTactical(!wpn:GetTactical())
	
		surface.PlaySound("tacint/weapons/slidelock_plastic-4.wav")
	
		if ply:FlashlightIsOn() then return false end -- if hl2 flahslight is on we will turn it off as expected
		return true -- we dont want hl2 flashlight
	end
end)