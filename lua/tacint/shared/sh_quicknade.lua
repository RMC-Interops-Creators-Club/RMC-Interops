TacInt.QuickNades = {
    ["frag"] = {
        PrintName = "FRAG",
        GrenadeEnt = "tacint_proj_nade_frag",
        ThrowForce = 2000,
        Ammo = "grenade",
        Model = "models/weapons/tacint/v_quicknade_frag.mdl",
        Spoon = true,
        Icon = Material("tacint/grenades/frag.png", "mips smooth")
    },
    ["flashbang"] = {
        PrintName = "FLASH",
        GrenadeEnt = "tacint_proj_nade_flashbang",
        ThrowForce = 2000,
        Ammo = "ti_flashbang",
        Model = "models/weapons/tacint/v_quicknade_flashbang.mdl",
        Spoon = true,
        Icon = Material("tacint/grenades/flashbang.png", "mips smooth")
    },
    ["smoke"] = {
        PrintName = "SMOKE",
        GrenadeEnt = "tacint_proj_nade_smoke",
        ThrowForce = 2000,
        Ammo = "ti_smoke",
        Model = "models/weapons/tacint/v_quicknade_smoke.mdl",
        Spoon = true,
        Icon = Material("tacint/grenades/smoke.png", "mips smooth")
    },
    ["gas"] = {
        PrintName = "GAS",
        GrenadeEnt = "tacint_proj_nade_gas",
        ThrowForce = 2000,
        Ammo = "ti_gas",
        Model = "models/weapons/tacint/v_quicknade_smoke.mdl",
        Spoon = true,
        Material = "models/tacint/weapons/v_models/smoke/gas-1",
        Icon = Material("tacint/grenades/gas.png", "mips smooth")
    },
    ["thermite"] = {
        PrintName = "FIRE",
        GrenadeEnt = "tacint_proj_nade_thermite",
        ThrowForce = 2000,
        Ammo = "ti_thermite",
        Model = "models/weapons/tacint/v_quicknade_smoke.mdl",
        Spoon = true,
        Material = "models/tacint/weapons/v_models/smoke/thermite-1",
        Icon = Material("tacint/grenades/thermite.png", "mips smooth")
    },
    ["c4"] = {
        PrintName = "C4",
        GrenadeEnt = "tacint_proj_nade_c4",
        ThrowForce = 2000,
        Ammo = "ti_c4",
        Model = "models/weapons/tacint/v_quicknade_c4.mdl",
        Spoon = false,
        Secret = true,
        Icon = Material("tacint/grenades/c4.png", "mips smooth")
    },
    ["nuke"] = {
        PrintName = "NUKE",
        GrenadeEnt = "tacint_proj_nade_nuke",
        ThrowForce = 500,
        Ammo = "ti_nuke",
        Model = "models/weapons/tacint/v_quicknade_nuke.mdl",
        Spoon = false,
        Secret = true,
        Icon = Material("tacint/grenades/nuke.png", "mips smooth")
    },
}

TacInt.QuickNades_Index = {}

TacInt.QuickNades_Count = 0

for i, k in pairs(TacInt.QuickNades) do
    TacInt.QuickNades_Count = TacInt.QuickNades_Count + 1

    TacInt.QuickNades_Index[TacInt.QuickNades_Count] = i
    k.Index = TacInt.QuickNades_Count
end