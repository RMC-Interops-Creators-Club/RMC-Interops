function SWEP:ReceiveWeapon()
    for slot, slottbl in pairs(self.Attachments) do
        local attid = net.ReadUInt(TacInt.Attachments_Bits)

        if attid == 0 then
            slottbl.Installed = nil
        else
            slottbl.Installed = TacInt.Attachments_Index[attid]
        end
    end

    self:SetupModel(true)
    self:SetupModel(false)
end

function SWEP:RequestWeapon()
    net.Start("tacint_networkweapon")
    net.WriteEntity(self)
    net.SendToServer()
end