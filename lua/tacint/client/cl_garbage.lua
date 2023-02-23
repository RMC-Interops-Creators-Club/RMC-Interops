TacInt.CSModelPile    = {} -- { {Model = NULL, Weapon = NULL} }
TacInt.FlashlightPile = {}

function TacInt.CollectGarbage()
    local removed = 0

    local newpile = {}

    for _, k in pairs(TacInt.CSModelPile) do
        if IsValid(k.Weapon) then
            table.insert(newpile, k)

            continue
        end

        SafeRemoveEntity(k.Model)

        removed = removed + 1
    end

    TacInt.CSModelPile = newpile

    if GetConVar("developer"):GetBool() and removed > 0 then
        print("Removed " .. tostring(removed) .. " CSModels")
    end
end

hook.Add("PostCleanupMap", "TacInt.CleanGarbage", function()
    TacInt.CollectGarbage()
end)

timer.Create("TacInt CSModel Garbage Collector", 5, 0, TacInt.CollectGarbage)

hook.Add("PostDrawEffects", "TacInt_CleanFlashlights", function()
    local newflashlightpile = {}

    for _, k in pairs(TacInt.FlashlightPile) do
        if IsValid(k.Weapon) and k.Weapon == LocalPlayer():GetActiveWeapon() then
            table.insert(newflashlightpile, k)

            continue
        end

        if k.ProjectedTexture and k.ProjectedTexture:IsValid() then
            k.ProjectedTexture:Remove()
        end
    end

    TacInt.FlashlightPile = newflashlightpile

    local wpn = LocalPlayer():GetActiveWeapon()

    if !wpn then return end
    if !IsValid(wpn) then return end
    if !wpn.ArcticTacInt then return end

    if GetViewEntity() == LocalPlayer() then return end

    wpn:KillFlashlightsVM()
end)