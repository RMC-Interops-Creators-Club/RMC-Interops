// the 0 is for load order!!!

local conVars = {
    {
        name = "showgrenadepanel",
        default = "1",
        type = "bool",
        client = true
    },
    {
        name = "crosshair_shadow",
        default = "0",
        type = "bool",
        client = true
    },
    {
        name = "crosshair_r",
        default = "0",
        client = true
    },
    {
        name = "crosshair_g",
        default = "255",
        client = true
    },
    {
        name = "crosshair_b",
        default = "0",
        client = true
    },
    {
        name = "autoreload",
        default = "1",
        client = true
    },
    {
        name = "autosave",
        default = "1",
        client = true
    },
    {
        name = "bodydamagecancel",
        default = "1",
        replicated = true
    },
    {
        name = "hl2ammo",
        default = "0",
        replicated = true
    },
    {
        name = "free_atts",
        default = "1",
        replicated = true
    },
    {
        name = "lock_atts",
        default = "0",
        replicated = true
    },
    {
        name = "loseattsondie",
        default = "1",
    },
    {
        name = "generateattentities",
        default = "1",
        replicated = true
    },
    {
        name = "maxclipsgiven",
        default = "12",
    },
    {
        name = "maxnadesgiven",
        default = "3",
    },
    {
        name = "npc_equality",
        default = "0",
    },
    {
        name = "npc_atts",
        default = "1",
    },
    {
        name = "penetration",
        default = "1",
        replicated = true
    },
}

local prefix = "tacint_"

for _, var in pairs(conVars) do
    local convar_name = prefix .. var.name

    if var.client and CLIENT then
        CreateClientConVar(convar_name, var.default, true)
    else
        local flags = FCVAR_ARCHIVE
        if var.replicated then
            flags = flags + FCVAR_REPLICATED
        end
        CreateConVar(convar_name, var.default, flags)
    end
end

if CLIENT then

local function menu_client_ti(panel)
    panel:AddControl("checkbox", {
        label = "Reload Automatically",
        command = "tacint_autoreload"
    })
    panel:AddControl("checkbox", {
        label = "Auto-Save Weapon",
        command = "tacint_autosave"
    })
    panel:AddControl("color", {
        label = "Crosshair Color",
        red = "tacint_crosshair_r",
        green = "tacint_crosshair_g",
        blue = "tacint_crosshair_b",
    })
    panel:AddControl("checkbox", {
        label = "Crosshair Shadow",
        command = "tacint_crosshair_shadow"
    })
    panel:AddControl("checkbox", {
        label = "Show Grenade Panel",
        command = "tacint_showgrenadepanel"
    })
end

local function menu_server_ti(panel)
    panel:AddControl("checkbox", {
        label = "Free Attachments",
        command = "tacint_free_atts"
    })
    panel:AddControl("checkbox", {
        label = "Attachment Locking",
        command = "tacint_lock_atts"
    })
    panel:AddControl("checkbox", {
        label = "Lose Attachments On Death",
        command = "tacint_loseattsondie"
    })
    panel:AddControl("checkbox", {
        label = "Generate Attachment Entities",
        command = "tacint_generateattentities"
    })
    panel:AddControl("slider", {
        label = "Max Clips Supplied",
        command = "tacint_maxclipsgiven",
        type = "int",
        min = 1,
        max = 128
    })
    panel:AddControl("slider", {
        label = "Max Grenades Supplied",
        command = "tacint_maxnadesgiven",
        type = "int",
        min = 1,
        max = 128
    })
    panel:AddControl("checkbox", {
        label = "Enable Penetration",
        command = "tacint_penetration"
    })
    panel:AddControl("checkbox", {
        label = "Use HL2 Ammo Types",
        command = "tacint_hl2ammo"
    })
    panel:AddControl("checkbox", {
        label = "NPCs Deal Equal Damage",
        command = "tacint_npc_equality"
    })
    panel:AddControl("checkbox", {
        label = "NPCs Get Random Attachments",
        command = "tacint_npc_atts"
    })
    panel:AddControl("label", {
        text = "Disable body damage cancel only if you have another addon that will override the hl2 limb damage multipliers."
    })
    panel:AddControl("checkbox", {
        label = "Default Body Damage Cancel",
        command = "tacint_bodydamagecancel"
    })
end

local clientmenus_ti = {
    {
        text = "Client", func = menu_client_ti
    },
    {
        text = "Server", func = menu_server_ti
    },
}

hook.Add("PopulateToolMenu", "TacInt_MenuOptions", function()
    for smenu, data in pairs(clientmenus_ti) do
        spawnmenu.AddToolMenuOption("Options", "Tactical Intervention", "tacint_" .. tostring(smenu), data.text, "", "", data.func)
    end
end)

end