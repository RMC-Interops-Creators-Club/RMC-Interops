function SWEP:SavePreset(filename)
    if LocalPlayer() != self:GetOwner() then return end

    filename = filename or "autosave"

    local str = ""
    for i, k in pairs(self.Attachments) do
        if k.Installed then
            str = str .. k.Installed
        end

        str = str .. "\n"
    end

    filename = TacInt.PresetPath .. self:GetClass() .. "/" .. filename .. ".txt"

    file.CreateDir(TacInt.PresetPath .. self:GetClass())
    file.Write(filename, str)
end

function SWEP:LoadPreset(filename)
    if LocalPlayer() != self:GetOwner() then return end

    filename = "autosave"
    filename = TacInt.PresetPath .. self:GetClass() .. "/" .. filename .. ".txt"

    if !file.Exists(filename, "DATA") then return end

    local f = file.Open(filename, "r", "DATA")
    if !f then return end

    local presetTbl = {}

    for i = 1, table.Count(self.Attachments) do
        local line = f:ReadLine()
        if !line then continue end
        presetTbl[i] = string.Trim(line, "\n")
    end

    local anyinstalled = false

    for i = 1, table.Count(self.Attachments) do
        local att = presetTbl[i]
        if att == "" then
            self.Attachments[i].Installed = nil
            continue
        end

        if !self.Attachments[i] then continue end

        if att == self.Attachments[i].Installed then continue end
        if !TacInt.GetAttTable(att) then continue end

        self.Attachments[i].Installed = att

        anyinstalled = true
    end

    f:Close()

    if !anyinstalled then return end

    net.Start("tacint_receivepreset")
    net.WriteEntity(self)
    for i, k in pairs(self.Attachments) do
        if !k.Installed then
            net.WriteUInt(0, TacInt.Attachments_Bits)
        else
            local atttbl = TacInt.GetAttTable(k.Installed)
            net.WriteUInt(atttbl.ID, TacInt.Attachments_Bits)
        end
    end
    net.SendToServer()

    self.StatCache = {}
    self.HookCache = {}

    self:SetBaseSettings()
end