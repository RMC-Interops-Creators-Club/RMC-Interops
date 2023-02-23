local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("Grenade.PullPin", {
    "tacint/weapons/grenade/pullpin-1.wav",
    "tacint/weapons/grenade/pullpin-2.wav"
})

addsound("Grenade.Throw", {
    "tacint/weapons/grenade/throw-1.wav",
    "tacint/weapons/grenade/throw-2.wav"
})

addsound("tacint_genericrifle.jingle", {
    "tacint/weapons/rifle_jingle-1.wav",
    "tacint/weapons/rifle_jingle-2.wav",
    "tacint/weapons/rifle_jingle-3.wav",
    "tacint/weapons/rifle_jingle-4.wav",
    "tacint/weapons/rifle_jingle-5.wav",
    "tacint/weapons/rifle_jingle-6.wav",
})

addsound("weapon.swing", {
    "tacint/weapons/swing_rifle-1.wav",
    "tacint/weapons/swing_rifle-2.wav"
})

addsound("weapon.thrust", {
    "tacint/weapons/thrust_rifle-1.wav",
    "tacint/weapons/thrust_rifle-2.wav"
})

addsound("tacint_genericpistol.holster", {
    "tacint/weapons/pistol_holster-1.wav",
    "tacint/weapons/pistol_holster-2.wav",
    "tacint/weapons/pistol_holster-3.wav",
    "tacint/weapons/pistol_holster-4.wav",
})

addsound("tacint_genericpistol.unholster", {
    "tacint/weapons/pistol_unholster-1.wav",
    "tacint/weapons/pistol_unholster-2.wav",
    "tacint/weapons/pistol_unholster-3.wav",
    "tacint/weapons/pistol_unholster-4.wav",
})

addsound("Weapon.Pistol_Clip_Scrape_Metal", {
    "tacint/weapons/pistol_clip_scrape_metal-1.wav",
    "tacint/weapons/pistol_clip_scrape_metal-2.wav",
    "tacint/weapons/pistol_clip_scrape_metal-3.wav",
    "tacint/weapons/pistol_clip_scrape_metal-4.wav",
})

addsound("Weapon.Pistol_Clip_Scrape_plastic", {
    "tacint/weapons/pistol_clip_scrape_plastic-1.wav",
    "tacint/weapons/pistol_clip_scrape_plastic-2.wav",
    "tacint/weapons/pistol_clip_scrape_plastic-3.wav",
})