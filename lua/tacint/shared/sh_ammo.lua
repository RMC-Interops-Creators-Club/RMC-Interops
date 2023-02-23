local ammotypes = {
    ["ti_flashbang"] = "Flashbangs",
    ["ti_thermite"] = "Fire Grenades",
    ["ti_smoke"] = "Smoke Grenades",
    ["ti_c4"] = "C4 Charges",
    ["ti_gas"] = "Gas Grenades",
    ["ti_9mm"] = "9mm Parabellum",
    ["ti_45acp"] = ".45 ACP",
    ["ti_12g"] = "12 Gauge",
    ["ti_556"] = "5.56mm NATO",
    ["ti_357"] = ".357 Magnum",
    ["ti_rpg7"] = "RPG-7 Rocket",
    ["ti_40mm"] = "40mm Grenade",
    ["ti_32acp"] = ".32 Auto",
    ["ti_50bmg"] = ".50 BMG",
    ["ti_308"] = ".308 Winchester",
    ["ti_nuke"] = "Nuclear Device",
    ["ti_762nato"] = "7.62mm NATO",
    ["ti_762wp"] = "7.62x39mm WP",
    ["ti_47mm"] = "4.7mm HK",
    ["ti_57mm"] = "5.7mm FN"
}

for i, k in pairs(ammotypes) do
    game.AddAmmoType({
        name = i
    })

    if CLIENT then
        language.Add(i .. "_ammo", k)
    end
end