function TacInt:PlayerGetAtts(ply, att)
    if !IsValid(ply) then return 0 end
    if GetConVar("tacint_free_atts"):GetBool() then return 999 end

    if att == "" then return 999 end

    local atttbl = TacInt.GetAttTable(att)

    if !atttbl then return 0 end

    if atttbl.Free then return 999 end

    if !IsValid(ply) then return 0 end

    if !ply:IsAdmin() and atttbl.AdminOnly then
        return 0
    end

    if atttbl.InvAtt then att = atttbl.InvAtt end

    if !ply.TacInt_AttInv then return 0 end

    if !ply.TacInt_AttInv[att] then return 0 end

    return ply.TacInt_AttInv[att]
end

function TacInt:PlayerGiveAtt(ply, att, amt)
    amt = amt or 1

    if !IsValid(ply) then return end

    if !ply.TacInt_AttInv then
        ply.TacInt_AttInv = {}
    end

    local atttbl = TacInt.GetAttTable(att)

    if !atttbl then print("Invalid att " .. att) return end
    if atttbl.Free then return end -- You can't give a free attachment, silly
    if atttbl.AdminOnly and !(ply:IsPlayer() and ply:IsAdmin()) then return false end

    if atttbl.InvAtt then att = atttbl.InvAtt end

    if GetConVar("tacint_lock_atts"):GetBool() then
        if ply.TacInt_AttInv[att] == 1 then return end
        ply.TacInt_AttInv[att] = 1
    else
        ply.TacInt_AttInv[att] = (ply.TacInt_AttInv[att] or 0) + amt
    end
end


function TacInt:PlayerTakeAtt(ply, att, amt)
    amt = amt or 1

    if GetConVar("tacint_lock_atts"):GetBool() then return end

    if !IsValid(ply) then return end

    if !ply.TacInt_AttInv then
        ply.TacInt_AttInv = {}
    end

    local atttbl = TacInt.GetAttTable(att)
    if !atttbl or atttbl.Free then return end

    if atttbl.InvAtt then att = atttbl.InvAtt end

    ply.TacInt_AttInv[att] = ply.TacInt_AttInv[att] or 0

    if ply.TacInt_AttInv[att] < amt then
        return false
    end

    ply.TacInt_AttInv[att] = ply.TacInt_AttInv[att] - amt
    if ply.TacInt_AttInv[att] <= 0 then
        ply.TacInt_AttInv[att] = nil
    end
    return true
end

if CLIENT then

net.Receive("TacInt_sendattinv", function(len, ply)
    LocalPlayer().TacInt_AttInv = {}

    local count = net.ReadUInt(32)

    for i = 1, count do
        local attid = net.ReadUInt(TacInt.Attachments_Bits)
        local acount = net.ReadUInt(32)

        local att = TacInt.Attachments_Index[attid]

        LocalPlayer().TacInt_AttInv[att] = acount
    end
end)

elseif SERVER then

hook.Add("PlayerDeath", "TacInt_DeathAttInv", function(ply)
    -- if GetConVar("tacint_loseattsondie"):GetBool() then
    --     ply.TacInt_AttInv = ply.TacInt_AttInv or {}
    -- end
    -- if table.Count(ply.TacInt_AttInv) > 0
    --         and GetConVar("tacint_attinv_loseondie"):GetInt() >= 2
    --         and !GetConVar("tacint_free_atts"):GetBool() then
    --     local boxEnt = ents.Create("TacInt_att_dropped")
    --     boxEnt:SetPos(ply:GetPos() + Vector(0, 0, 4))
    --     boxEnt.GiveAttachments = ply.TacInt_AttInv
    --     boxEnt:Spawn()
    --     boxEnt:SetNWString("boxname", ply:GetName() .. "'s Death Box")
    --     local count = 0
    --     for i, v in pairs(boxEnt.GiveAttachments) do count = count + v end
    --     boxEnt:SetNWInt("boxcount", count)
    -- end
end)

hook.Add("PlayerSpawn", "TacInt_SpawnAttInv", function(ply, trans)
    if trans then return end

    if GetConVar("tacint_loseattsondie"):GetInt() >= 1 then
        ply.TacInt_AttInv = {}

        TacInt:PlayerSendAttInv(ply)
    end
end)

function TacInt:PlayerSendAttInv(ply)
    if GetConVar("tacint_free_atts"):GetBool() then return end

    if !IsValid(ply) then return end

    if !ply.TacInt_AttInv then return end

    net.Start("tacint_sendattinv")

    net.WriteUInt(table.Count(ply.TacInt_AttInv), 32)

    for att, count in pairs(ply.TacInt_AttInv) do
        local atttbl = TacInt.GetAttTable(att)
        local attid = atttbl.ID
        net.WriteUInt(attid, TacInt.Attachments_Bits)
        net.WriteUInt(count, 32)
    end

    net.Send(ply)
end

end
