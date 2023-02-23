SWEP.VModel = nil
SWEP.WModel = nil

function SWEP:KillModel()
    for _, model in pairs(self.VModel or {}) do
        SafeRemoveEntity(model)
    end
    for _, model in pairs(self.WModel or {}) do
        SafeRemoveEntity(model)
    end

    self.VModel = nil
    self.WModel = nil
end

function SWEP:SetupModel(wm)
    self:KillModel()

    if !wm and !IsValid(self:GetOwner()) then return end

    if !wm then
        self.VModel = {}
    else
        self.WModel = {}
    end

    self:DoBodygroups(wm)

    for slot, slottbl in pairs(self.Attachments) do
        if !slottbl.Installed then continue end

        local atttbl = TacInt.GetAttTable(slottbl.Installed)

        if !atttbl.Model then continue end

        local model = atttbl.Model

        if wm and atttbl.WorldModel then
            model = atttbl.WorldModel
        end

        local csmodel = ClientsideModel(model)

        if !IsValid(csmodel) then return end

        csmodel:SetNoDraw(true)
        csmodel.Slot = slot

        local scale = Matrix()
        local vec = Vector(1, 1, 1) * (atttbl.Scale or 1)
        if wm then
            vec = vec * (slottbl.WMScale or 1)
        else
            vec = vec * (slottbl.VMScale or 1)
        end
        scale:Scale(vec)
        csmodel:EnableMatrix("RenderMultiply", scale)

        if wm then
            table.insert(self.WModel, csmodel)
            slottbl.WModel = csmodel
        else
            table.insert(self.VModel, csmodel)
            slottbl.VModel = csmodel
        end

        local tbl = {
            Model = csmodel,
            Weapon = self
        }

        table.insert(TacInt.CSModelPile, tbl)
    end

    if !wm then
        self:CreateFlashlightsVM()
    end
end