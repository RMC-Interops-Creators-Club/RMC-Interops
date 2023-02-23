local blindfiredelta = 0
local customizedelta = 0

function SWEP:GetViewModelPosition(pos, ang)
    if false then
        return Vector(0, 0, 0), Angle(0, 0, 0)
    end

    local offsetpos = Vector(0, 0, 0)
    local offsetang = Angle(0, 0, 0)

    offsetpos:Set(self:GetValue("PassivePos"))
    offsetang:Set(self:GetValue("PassiveAng"))

    if self:GetBlindFire() then
        blindfiredelta = math.Approach(blindfiredelta, 1, FrameTime() * 1 / 0.15)
    else
        blindfiredelta = math.Approach(blindfiredelta, 0, FrameTime() * 1 / 0.15)
    end

    local curvedblindfiredelta = self:Curve(blindfiredelta)

    if blindfiredelta > 0 then
        offsetpos = LerpVector(curvedblindfiredelta, offsetpos, self:GetValue("BlindFirePos"))
        offsetang = LerpAngle(curvedblindfiredelta, offsetang, self:GetValue("BlindFireAng"))
    end

    if game.SinglePlayer() or IsFirstTimePredicted() then
        if self:GetCustomize() then
            customizedelta = math.Approach(customizedelta, 1, FrameTime() * 1 / 0.15)
        else
            customizedelta = math.Approach(customizedelta, 0, FrameTime() * 1 / 0.15)
        end
    end

    local curvedcustomizedelta = self:Curve(customizedelta)

    if customizedelta > 0 then
        offsetpos = LerpVector(curvedcustomizedelta, offsetpos, self:GetValue("CustomizePos"))
        offsetang = LerpAngle(curvedcustomizedelta, offsetang, self:GetValue("CustomizeAng"))
    end

    -- local sprintdelta = self:Curve(self:GetSprintDelta())
    local sprintdelta = self:Curve(self:GetSprintDelta())

    if sprintdelta > 0 then
        offsetpos = LerpVector(sprintdelta, offsetpos, self:GetValue("SprintPos"))
        offsetang = LerpAngle(sprintdelta, offsetang, self:GetValue("SprintAng"))
    end

    self.BobScale = Lerp(sprintdelta, 1, 3)

    pos = pos + (ang:Right() * offsetpos[1])
    pos = pos + (ang:Forward() * offsetpos[2])
    pos = pos + (ang:Up() * offsetpos[3])

    ang:RotateAroundAxis(ang:Up(), offsetang[1])
    ang:RotateAroundAxis(ang:Right(), offsetang[2])
    ang:RotateAroundAxis(ang:Forward(), offsetang[3])

    return pos, ang
end