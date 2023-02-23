if CLIENT then return end

util.AddNetworkString("tacint_toggleblindfire")
util.AddNetworkString("tacint_togglecustomize")
util.AddNetworkString("tacint_reloadatts")
util.AddNetworkString("tacint_networkweapon")
util.AddNetworkString("tacint_attach")
util.AddNetworkString("tacint_receivepreset")
util.AddNetworkString("tacint_sendattinv")

net.Receive("tacint_toggleblindfire", function(len, ply)
    local bf = net.ReadBool()

    local wpn = ply:GetActiveWeapon()

    if !wpn or !IsValid(wpn) or !wpn.ArcticTacInt then return end

    wpn:ToggleBlindFire(bf)
end)

net.Receive("tacint_togglecustomize", function(len, ply)
    local bf = net.ReadBool()

    local wpn = ply:GetActiveWeapon()

    if !wpn or !IsValid(wpn) or !wpn.ArcticTacInt then return end

    wpn:ToggleCustomize(bf)
end)

net.Receive("tacint_networkweapon", function(len, ply)
    local wpn = net.ReadEntity()

    if !wpn.ArcticTacInt then return end

    wpn:NetworkWeapon(ply)
end)

net.Receive("tacint_attach", function(len, ply)
    local wpn = net.ReadEntity()

    local attach = net.ReadBool()
    local slot = net.ReadUInt(8)
    local attid = 0

    if attach then
        attid = net.ReadUInt(TacInt.Attachments_Bits)
    end

    if !wpn.ArcticTacInt then return end

    if attach then
        local att = TacInt.Attachments_Index[attid]

        wpn:Attach(slot, att, true)
    else
        wpn:Detach(slot, true)
    end
end)

net.Receive("tacint_receivepreset", function(len, ply)
    local wpn = net.ReadEntity()

    if !wpn.ArcticTacInt then return end

    wpn:ReceivePreset()
end)