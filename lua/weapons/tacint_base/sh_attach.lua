function SWEP:Attach(slot, att, silent)
    local slottbl = self.Attachments[slot]
    if slottbl.Installed then return end

    if !self:CanAttach(slot, att) then return end

    local atttbl = TacInt.GetAttTable(att)

    if !atttbl then return end
    if TacInt:PlayerGetAtts(self:GetOwner(), att) <= 0 then return end

    slottbl.Installed = att

    TacInt:PlayerTakeAtt(self:GetOwner(), att, 1)

    if CLIENT then
        local attid = atttbl.ID

        net.Start("tacint_attach")
        net.WriteEntity(self)
        net.WriteBool(true)
        net.WriteUInt(slot, 8)
        net.WriteUInt(attid, TacInt.Attachments_Bits)
        net.SendToServer()

        self:SetupModel(true)
        self:SetupModel(false)

        if !silent then
            surface.PlaySound(slottbl.AttachSound or "")
        end
    else
        self:NetworkWeapon()

        TacInt:PlayerSendAttInv(self:GetOwner())
    end

    self.StatCache = {}
    self.HookCache = {}

    self:SetBaseSettings()
    self:SetTactical(true)
end

function SWEP:Detach(slot, silent)
    local slottbl = self.Attachments[slot]
    if !slottbl.Installed then return end

    if !self:CanDetach(slot) then return end

    TacInt:PlayerGiveAtt(self:GetOwner(), slottbl.Installed, 1)

    slottbl.Installed = nil

    if CLIENT then
        net.Start("tacint_attach")
        net.WriteEntity(self)
        net.WriteBool(false)
        net.WriteUInt(slot, 8)
        net.SendToServer()

        self:SetupModel(true)
        self:SetupModel(false)

        if !silent then
            surface.PlaySound(slottbl.DetachSound or "")
        end
    else
        self:NetworkWeapon()

        TacInt:PlayerSendAttInv(self:GetOwner())
    end

    self.StatCache = {}
    self.HookCache = {}

    self:SetBaseSettings()
end

function SWEP:ToggleCustomize(on)
    if on == self:GetCustomize() then return end

    self:ScopeToggle(0)
    self:ToggleBlindFire(false)

    self:SetCustomize(on)

    self:SetShouldHoldType()
end

function SWEP:CanAttach(slot, att)
    local atttbl = TacInt.GetAttTable(att)

    local slottbl = self.Attachments[slot]

    local cat = slottbl.Category

    if !istable(cat) then
        cat = {cat}
    end

    local attcat = atttbl.Category

    if !istable(attcat) then
        attcat = {attcat}
    end

    for _, c in pairs(attcat) do
        if table.HasValue(cat, c) then
            return true
        end
    end

    return false
end

function SWEP:CanDetach(slot)
    local slottbl = self.Attachments[slot]

    if slottbl.Integral then return false end

    return true
end