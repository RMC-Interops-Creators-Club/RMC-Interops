TacInt.Attachments = {}
TacInt.Attachments_Index = {}

TacInt.Attachments_Count = 0

TacInt.Attachments_Bits = 16

function TacInt.LoadAtts()
    TacInt.Attachments_Count = 0
    TacInt.Attachments = {}
    TacInt.Attachments_Index = {}

    local searchdir = "tacint/shared/atts/"

    local files = file.Find(searchdir .. "/*.lua", "LUA")

    for _, filename in pairs(files) do
        AddCSLuaFile(searchdir .. filename)
    end

    files = file.Find(searchdir .. "/*.lua", "LUA")

    for _, filename in pairs(files) do
        if filename == "default.lua" then continue end

        ATT = {}

        local shortname = string.sub(filename, 1, -5)

        include(searchdir .. filename)

        if ATT.Ignore then continue end

        TacInt.Attachments_Count = TacInt.Attachments_Count + 1

        ATT.ShortName = shortname
        ATT.ID = TacInt.Attachments_Count

        TacInt.Attachments[shortname] = ATT
        TacInt.Attachments_Index[TacInt.Attachments_Count] = shortname

        if GetConVar("tacint_generateattentities"):GetBool() and !ATT.DoNotRegister and !ATT.InvAtt and !ATT.Free then
            local attent = {}
            attent.Base = "tacint_att"
            attent.Icon = ATT.Icon
            attent.PrintName = ATT.PrintName or shortname
            attent.Spawnable = true
            attent.AdminOnly = ATT.AdminOnly or false
            attent.AttToGive = shortname
            attent.Category = "RMC Interops - Attachments"

            print("Registering entity for " .. shortname)

            scripted_ents.Register(attent, "tacint_att_" .. shortname)
        end
    end

    TacInt.Attachments_Bits = math.min(math.ceil(math.log(TacInt.Attachments_Count + 1, 2)), 32)
end

TacInt.LoadAtts()

function TacInt.GetAttTable(name)
    local shortname = name
    if isnumber(shortname) then
        shortname = TacInt.Attachments_Index[name]
    end

    if TacInt.Attachments[shortname] then
        return TacInt.Attachments[shortname]
    else
        assert(false, "!!!! TacInt tried to access invalid attachment " .. (shortname or "NIL") .. "!!!")
        return {}
    end
end

function TacInt.GetAttsForCats(cats)
    if !istable(cats) then
        cats = {cats}
    end

    local atts = {}

    for i, k in pairs(TacInt.Attachments) do
        local attcats = k.Category
        if !istable(attcats) then
            attcats = {attcats}
        end

        for _, cat in pairs(cats) do
            if table.HasValue(attcats, cat) then
                table.insert(atts, k.ShortName)
                break
            end
        end
    end

    return atts
end

if CLIENT then

concommand.Add("tacint_reloadatts", function()
    if !LocalPlayer():IsSuperAdmin() then return end

    net.Start("tacint_reloadatts")
    net.SendToServer()
end)

net.Receive("tacint_reloadatts", function(len, ply)
    TacInt.LoadAtts()
end)

elseif SERVER then

net.Receive("tacint_reloadatts", function(len, ply)
    if !ply:IsSuperAdmin() then return end

    TacInt.LoadAtts()

    net.Start("tacint_reloadatts")
    net.Broadcast()
end)

end