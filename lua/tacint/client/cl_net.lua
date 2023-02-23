net.Receive("tacint_networkweapon", function(len, ply)
    local wpn = net.ReadEntity()

    if !wpn.ArcticTacInt then return end

    wpn:ReceiveWeapon()
end)