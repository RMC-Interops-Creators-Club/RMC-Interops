function SWEP:ThinkRecoil()
    if (IsFirstTimePredicted() and CLIENT) or game.SinglePlayer() then
        if self:GetRecoilAmount() > 0 then
            local kick = self:GetValue("RecoilKick")
            local recoildir = self:GetRecoilDirection()
            local rec = self:GetRecoilAmount()

            local eyeang = self:GetOwner():EyeAngles()

            if self:GetOwner():InVehicle() then
                local vehang = self:GetOwner():GetVehicle():GetAngles()

                eyeang.y = eyeang.y - vehang.y
                eyeang.p = eyeang.p + vehang.p
                eyeang.r = vehang.r
            end

            eyeang.p = eyeang.p + math.sin(math.rad(recoildir)) * FrameTime() * kick * rec
            eyeang.y = eyeang.y + math.cos(math.rad(recoildir)) * FrameTime() * kick * rec

            self:GetOwner():SetEyeAngles(eyeang)
        end
    end

    if self:GetLastRecoilTime() + self:GetValue("RecoilResetTime") < CurTime() then
        local rec = self:GetRecoilAmount()

        rec = rec - (FrameTime() * self:GetValue("RecoilDissipationRate"))

        rec = math.Clamp(rec, 0, self:GetValue("RecoilMaximum"))

        self:SetRecoilAmount(rec)
    end
end

function SWEP:ApplyRecoil()
    local rec = self:GetRecoilAmount()

    local rps = self:GetValue("RecoilPerShot")

    if rec == 0 then
        rps = rps * self:GetValue("RecoilFirstShotMult")
    end

    rec = rec + rps

    rec = math.Clamp(rec, 0, self:GetValue("RecoilMaximum"))

    self:SetRecoilDirection(util.SharedRandom("tacint_recoildir", 0, -180))
    self:SetRecoilAmount(rec)
    self:SetLastRecoilTime(CurTime())

    local vis_kick = self:GetValue("RecoilVisualKick")
    local vis_shake = self:GetValue("RecoilVisualShake")

    vis_kick = vis_kick
    -- vis_shake = vis_shake * (rec + 1) * util.SharedRandom("tacint_vis_shake", -1, 1)
    vis_shake = 0

    local vis_kick_v = vis_kick * util.SharedRandom("tacint_vis_kick_v", -1, 1)
    local vis_kick_h = vis_kick * util.SharedRandom("tacint_vis_kick_h", -1, 1)

    self:GetOwner():SetViewPunchAngles(Angle(vis_kick_v, vis_kick_h, vis_shake))
end