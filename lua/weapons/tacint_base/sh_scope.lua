function SWEP:ScopeToggle(setlevel)
    if !self:GetValue("Scope") then return end
    if setlevel and setlevel > 0 and self:GetPrimedGrenade() then return end
    if setlevel and setlevel > 0 and self:GetAnimLockTime() > CurTime() or (!setlevel and self:GetAnimLockTime() > CurTime()) then return end
    if (setlevel and setlevel > 0 and self:GetReloading()) or (!setlevel and self:GetReloading()) then return end

    local level = self:GetScopeLevel()

    local oldlevel = level

    level = setlevel or (level + 1)

    if level > self:GetValue("ScopeLevels") then
        level = 0
    end

    if self:SprintLock() then
        level = 0
    end

    if self:GetCustomize() then
        level = 0
    end

    if level == self:GetScopeLevel() then return end

    self:SetScopeLevel(level)

    if level > 0 then
        self:ToggleBlindFire(false)
    end

    local fov = self:GetShouldFOV()

    if oldlevel == 0 or level == 0 then
        self:SetLastScopeTime(CurTime())
    end

    self:GetOwner():SetFOV(fov, 0.1)

    self:EmitSound(self:GetValue("Sound_ScopeIn"), 75, 100, 1, CHAN_ITEM)
end

function SWEP:GetShouldFOV()
    local level = self:GetScopeLevel()

    if level > 0 then
        local fov = self:GetValue("ScopeFOV")

        fov = Lerp(level / self:GetValue("ScopeLevels"), 90, fov)

        return fov
    else
        return 0
    end
end

local lastwacky = 0

function SWEP:DoScope()
    if self:GetScopeLevel() > 0 then

        local img = self:GetValue("ScopeOverlay")

        if img then
            local h = ScrH()
            local w = ScrW()

            -- assume players have a screen that is wider than it is tall because... that's stupid

            local pos = self:GetOwner():EyePos()

            pos = pos + self:GetOwner():EyeAngles():Forward() * 9000

            local toscreen = pos:ToScreen()

            local x = toscreen.x
            local y = toscreen.y

            local spread = self:GetSpread()
            local baselinespread = self:GetSpread(true)

            local wacky = spread - baselinespread

            local cross = math.Approach(lastwacky, wacky, math.abs(lastwacky - wacky) * 1 / 0.1 * FrameTime())

            lastwacky = cross

            local ss = math.Round(h * (1 + cross))
            local sx = x - (ss / 2)
            local sy = y - (ss / 2)

            -- local shakey = math.min(cross * 35, 3)

            -- sx = sx + math.Round(math.Rand(-shakey, shakey))
            -- sy = sy + math.Round(math.Rand(-shakey, shakey))

            surface.SetMaterial(img)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(sx, sy, ss, ss)

            surface.SetDrawColor(0, 0, 0)
            surface.DrawRect(0, 0, w, sy)
            surface.DrawRect(0, sy + ss, w, h - sy)

            surface.DrawRect(0, 0, sx, h)
            surface.DrawRect(sx + ss, 0, w - sx, h)
        end
    end
end

function SWEP:AdjustMouseSensitivity()
    local fov = self:GetShouldFOV()

    if fov > 0 then
        return fov / 90
    end
end

function SWEP:PreDrawViewModel()
    if self:GetValue("ScopeHideWeapon") then
        if self:GetScopeLevel() > 0 then
            render.SetBlend(0)
        end
    end
end

function SWEP:PostDrawViewModel()
    if self:GetValue("ScopeHideWeapon") then
        if self:GetScopeLevel() > 0 then
            render.SetBlend(1)
        end
    end
end
