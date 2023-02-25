function SWEP:DrawWorldModel()
    self:DrawCustomModel(true)
    self:DrawLasers(false)

    if self:GetValue("Laser") then
        self:SetRenderBounds(Vector(-16, -16, -16), Vector(16, 16, 15000))
    else
        self:SetRenderBounds(Vector(-16, -16, -16), Vector(16, 16, 16))
    end

    self:DrawModel()
end
