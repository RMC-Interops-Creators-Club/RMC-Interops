local lastcross = 0
local crossalpha = 255

function SWEP:ShouldDrawCrosshair()
    if self:GetScopeLevel() > 0 and self:GetValue("ScopeOverlay") then return false end
    if self:SprintLock() then return false end
    if self:GetCustomize() then return false end

    return true
end

function SWEP:DoDrawCrosshair(x, y)
    if self:ShouldDrawCrosshair() then
        crossalpha = math.Approach(crossalpha, 255, FrameTime() * 255 * 1 / 0.15)
    else
        crossalpha = math.Approach(crossalpha, 0, FrameTime() * 255 * 1 / 0.15)
    end

    if self:GetScopeLevel() > 0 and self:GetValue("ScopeOverlay") then return true end

    local pos = self:GetOwner():EyePos()
    local eyeang = self:GetOwner():EyeAngles()

    if self:GetOwner():InVehicle() then
        local vehang = self:GetOwner():GetVehicle():GetAngles()

        eyeang.y = eyeang.y + vehang.y
        eyeang.p = eyeang.p + vehang.p
    end

    pos = pos + eyeang:Forward() * 9000

    local toscreen = pos:ToScreen()

    x = toscreen.x
    y = toscreen.y

    local spread = self:GetSpread()

    local newcross = (0.01 + spread) * ScreenScale(128)

    local len = ScreenScale(5) * crossalpha / 255

    local cross = math.Approach(lastcross, newcross, (newcross - lastcross) * 1 / 0.1 * FrameTime())

    local dirs = self:GetValue("CrosshairDirs")

    for _, dir in pairs(dirs) do
        if _ == "BaseClass" then continue end
        local stx = x + (dir[1] * cross)
        local enx = stx + (dir[1] * len)

        local sty = y + (dir[2] * cross)
        local eny = sty + (dir[2] * len)

        if GetConVar("tacint_crosshair_shadow"):GetBool() then
            surface.SetDrawColor(0, 0, 0, crossalpha)
            surface.DrawLine(stx + 1, sty + 1, enx + 1, eny + 1)
        end

        local r = GetConVar("tacint_crosshair_r"):GetInt()
        local g = GetConVar("tacint_crosshair_g"):GetInt()
        local b = GetConVar("tacint_crosshair_b"):GetInt()

        surface.SetDrawColor(r, g, b, crossalpha)
        surface.DrawLine(stx, sty, enx, eny)
    end

    lastcross = cross

    return true
end

function SWEP:GetBinding(bind)
    local t_bind = input.LookupBinding(bind)

    if !t_bind then
        t_bind = "BIND " .. bind .. "!"
    end

    return string.upper(t_bind)
end

local sizes_to_make = {
	6,
	8,
	10,
	16,
	32
}
local function genfonts()
	for _, i in pairs(sizes_to_make) do
		surface.CreateFont( "TacInt_Hint_" .. tostring(i), {
			font = "Segoe UI",
			size = ScreenScale(i),
			weight = 0,
			antialias = true,
			extended = true, -- Required for non-latin fonts
		} )
	end
end
genfonts()

function SWEP:DoHintsHUD()
	local w, h = ScrW(), ScrH()
	local ss = ScreenScale
	local bw, bh = ss(160), ss(16)

	local col_bg = Color(0, 0, 0, 150)
	local col_corner = Color(255, 255, 255)
	local col_text = Color(255, 255, 255)

	surface.SetDrawColor( col_bg )
	TacInt.DrawCorneredBox( w - bw - ss(8), (h/2) - (bh/2), bw, bh, col_corner )

	do
		local sx, sy = (w - bw) - ss(4), (h/2) - ss(4)
		local txt = {
			font = "TacInt_Hint_8",
			pos = { sx, sy }
		}
		txt.text = "Hold USE and press ATTACK to throw a grenade."
		draw.Text(txt)
		txt.pos[2] = txt.pos[2] + ss(6)
		txt.text = "Hold ATTACK to throw it farther."
		draw.Text(txt)
	end
end

function SWEP:DrawHUD()
    self:DoScope()

    self:DrawCustomizeHUD()

    -- self:DoHintsHUD()
    self:RunHook("Hook_DrawHUD")

    if !GetConVar("tacint_showgrenadepanel"):GetBool() then return end

    if self:GetValue("CanQuickNade") then
        local nade = self:GetGrenade()

        local qn_x = ScrW() / 2

        local icon = nade.Icon

        local qty = "INF"

        if nade.Ammo then
            qty = tostring(self:GetOwner():GetAmmoCount(nade.Ammo))
        end

        surface.SetDrawColor(0, 0, 0, 150)
        TacInt.DrawCorneredBox(qn_x - (ScreenScale(64) / 2), ScrH() - ScreenScale(24) - ScreenScale(12), ScreenScale(64), ScreenScale(32))

        if nade.Icon then
            local s = ScreenScale(24)
            surface.SetMaterial(icon)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRect(qn_x - (s / 2), ScrH() - ScreenScale(12) - s, s, s)
        end

        local txt = nade.PrintName .. " × " .. qty
        surface.SetFont("TacInt_LondonBetween_10")
        local w = surface.GetTextSize(txt)
        surface.SetTextColor(255, 255, 255, 255)
        surface.SetTextPos(qn_x - (w / 2), ScrH() - ScreenScale(15))
        surface.DrawText(txt)
    end

end

SWEP.Mat_Select = nil

function SWEP:DrawWeaponSelection(x, y, w, h, a)
    if !self.Mat_Select then
        self.Mat_Select = Material("entities/" .. self:GetClass() .. ".png")
    end

    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(self.Mat_Select)

    if w > h then
        y = y - ((w - h) / 2)
    end

    surface.DrawTexturedRect(x, y, w, w)
end

function SWEP:RangeUnitize(range)
    if !GetConVar("tacint_metricunit"):GetBool() then
        return tostring(math.Round(range)) .. " hU"
    else
        return tostring(math.Round(range*TacInt.HUToM)) .. "m"
    end
end