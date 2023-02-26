local cancelmults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.25,
    [HITGROUP_RIGHTARM] = 0.25,
    [HITGROUP_LEFTLEG] = 0.25,
    [HITGROUP_RIGHTLEG] = 0.25,
    [HITGROUP_GEAR] = 0.25
}

function SWEP:StillWaiting()
    if self:GetNextPrimaryFire() > CurTime() then return true end
    if self:GetNextSecondaryFire() > CurTime() then return true end
    if self:GetAnimLockTime() > CurTime() then return true end
    if self:GetCustomize() then return true end
    if self:GetPrimedGrenade() then return true end

    return false
end

function SWEP:SprintLock()
    if self:GetSprintLockTime() > CurTime() then return true end
    if self:GetIsSprinting() then return true end

    return false
end

function SWEP:PrimaryAttack()
    if self:GetOwner():IsNPC() then
        self:NPC_PrimaryAttack()
        return
    end

    if self:GetReloading() then
        self:SetEndReload(true)
    end

    if self:StillWaiting() then self:SetBurstCount(0) return end

    if self:GetValue("CanQuickNade") then
        if self:GetOwner():KeyDown(IN_USE) then
            self:PrimeGrenade()
            self:SetBurstCount(0)
            return
        end
    end

    if self.PrimaryMelee then
        self:S_Melee()

        local sshoot = self:GetValue("Sound_Shoot")
        local pvar = self:GetValue("ShootPitchVariance")

        if istable(sshoot) then
            sshoot = table.Random(sshoot)
        end
        self:EmitSound(sshoot, self:GetValue("Vol_Shoot"), 100 + util.SharedRandom("tacint_sshoot", -pvar, pvar), 1, CHAN_WEAPON)
        return
    end

    if self:GetValue("Firemode") < 0 and self:GetBurstCount() >= -self:GetValue("Firemode") then return end
    if self:Clip1() < self:GetValue("AmmoPerShot") then
        self.Primary.Automatic = false
        if self:GetBlindFire() then
            self:PlayAnimation("blind_dryfire")
        else
            self:PlayAnimation("dryfire")
        end
        self:EmitSound(self:GetValue("Sound_DryFire"), 75, 100, 1, CHAN_BODY)
        self:SetBurstCount(0)
        self:SetNextPrimaryFire(CurTime() + 0.1)
        return
    end

    self:SetBaseSettings()

    if self:SprintLock() then return end

    local seq = "fire"

    local mult = self:GetValue("ShootSpeedMult")

    if self:GetValue("LastShot") and self:Clip1() == 1 then
        seq = "lastshot"
    end

    if self:GetBlindFire() then
        seq = "blind_" .. seq
    end

    if self:GetValue("Akimbo") and !self:GetBlindFire() then
        if self:GetNthShot() % 2 == 0 then
            seq = "shoot_left"
        else
            seq = "shoot_right"
        end

        if self:GetValue("LastShot") then
            if self:Clip1() == 0 then
                seq = seq .. "_lastshot"
            elseif self:Clip1() == 1 then
                seq = seq .. "_second_2_lastshot"
            end
        end
    end

    if self:HasSequence(seq .. "1") then
        local seq1 = seq .. tostring(self:GetBurstCount() + 1)

        if self:HasSequence(seq1) then
            self:PlayAnimation(seq1, mult)
        else
            for i = self:GetBurstCount() + 1, 1, -1 do
                local seq2 = seq .. tostring(i)
                if self:HasSequence(seq2) then
                    self:PlayAnimation(seq2, mult)
                    break
                end
            end
        end
    else
        self:PlayAnimation(seq, mult)
    end

    local ejectdelay = self:GetValue("EjectDelay")

    if ejectdelay == 0 then
        self:DoEject()
    else
        self:SetTimer(ejectdelay, function()
            self:DoEject()
        end)
    end

    self:GetOwner():DoAnimationEvent(self:GetValue("GestureShoot"))

    local pvar = self:GetValue("ShootPitchVariance")

    local sshoot = self:GetValue("Sound_Shoot")

    if self:GetValue("Silencer") then
        sshoot = self:GetValue("Sound_Shoot_Silenced")
    end

    if istable(sshoot) then
        sshoot = table.Random(sshoot)
    end

    self:EmitSound(sshoot, self:GetValue("Vol_Shoot"), 100 + util.SharedRandom("tacint_sshoot", -pvar, pvar), 1, CHAN_WEAPON)

    local delay = 60 / self:GetValue("RPM")

    local curatt = self:GetNextPrimaryFire()
    local diff = CurTime() - curatt

    if diff > engine.TickInterval() or diff < 0 then
        curatt = CurTime()
    end

    self:SetNextPrimaryFire(curatt + delay)

    self:SetBurstCount(self:GetBurstCount() + 1)

    self:TakePrimaryAmmo(self:GetValue("AmmoPerShot"))

    self:SetNthShot(self:GetNthShot() + 1)

    self:DoEffects()

    local spread = self:GetSpread()

    if self:GetValue("ShootEnt") then
        self:ShootRocket()
    else
        if IsFirstTimePredicted() or game.SinglePlayer() then
        self:GetOwner():LagCompensation(true)
            local tr = self:GetValue("TracerNum")

            if self:GetValue("ScopeOverlay") and self:GetScopeLevel() > 0 then
                tr = 0
            end

            self:GetOwner():FireBullets({
                Damage = self:GetValue("Damage_Max"),
                Force = 8,
                Tracer = tr,
                Num = self:GetValue("Num"),
                Dir = self:GetOwner():EyeAngles():Forward(),
                Src = self:GetMuzzleOrigin(),
                Spread = Vector(spread, spread, spread),
                IgnoreEntity = self:GetOwner():GetVehicle(),
                Callback = function(att, btr, dmg)
                    local range = (btr.HitPos - btr.StartPos):Length()

                    self:AfterShotFunction(btr, dmg, range, self:GetValue("Penetration"), {})

                    if GetConVar("developer"):GetBool() then
                        if SERVER then
                            debugoverlay.Cross(btr.HitPos, 4, 5, Color(255, 0, 0), false)
                        else
                            debugoverlay.Cross(btr.HitPos, 4, 5, Color(255, 255, 255), false)
                        end
                    end
                end
            })

            self:GetOwner():LagCompensation(false)
        end
    end

    self:ApplyRecoil()

    self:DoBulletBodygroups()

    if self:Clip1() == 0 then self.Primary.Automatic = false end
end

function SWEP:AfterShotFunction(tr, dmg, range, penleft, alreadypenned)
    if !IsFirstTimePredicted() and !game.SinglePlayer() then return end
    local dmgv = self:GetDamageAtRange(range)

    local bodydamage = self:GetValue("BodyDamageMultipliers")

    local dmgbodymult = 1

    if bodydamage[tr.HitGroup] then
        dmgbodymult = dmgbodymult * bodydamage[tr.HitGroup]
    end

    if GetConVar("tacint_bodydamagecancel"):GetBool() and cancelmults[tr.HitGroup] then
        dmgbodymult = dmgbodymult / cancelmults[tr.HitGroup]
    end

    dmgv = dmgv * dmgbodymult

    if self:GetOwner():IsNPC() and !GetConVar("tacint_npc_equality"):GetBool() then
        dmgv = dmgv * 0.25
    end

    dmg:SetDamage(dmgv)

    if tr.Entity and alreadypenned[tr.Entity] then
        dmg:SetDamage(0)
    elseif tr.Entity then
        alreadypenned[tr.Entity] = true
    end

    self:Penetrate(tr, range, penleft, alreadypenned)
end

function SWEP:GetDamageAtRange(range)
    local d = 1

    local r_min = self:GetValue("Range_Min")
    local r_max = self:GetValue("Range_Max")

    if range <= r_min then
        d = 0
    elseif range >= r_max then
        d = 1
    else
        d = (range - r_min) / (r_max - r_min)
    end

    local dmgv = Lerp(d, self:GetValue("Damage_Max"), self:GetValue("Damage_Min"))

    return dmgv
end

function SWEP:ShootRocket()
    if CLIENT then return end

    local src = self:GetMuzzleOrigin()
    local ang = self:GetOwner():EyeAngles()
    local num = self:GetValue("Num")
    local ent = self:GetValue("ShootEnt")

    local spread

    if self:GetOwner():IsNPC() then
        ang = self:GetOwner():GetAimVector():Angle()
        spread = self:GetNPCSpread()
    else
        spread = self:GetSpread()
    end

    for i = 1, num do
        local dispersion = Angle(math.Rand(-1, 1), math.Rand(-1, 1), 0)

        dispersion = dispersion * spread * 36

        local rocket = ents.Create(ent)
        if !IsValid(rocket) then return end

        rocket:SetPos(src)
        rocket:SetOwner(self:GetOwner())
        rocket:SetAngles(ang + dispersion)
        rocket:Spawn()

        local phys = rocket:GetPhysicsObject()

        if phys:IsValid() then
            phys:ApplyForceCenter((ang + dispersion):Forward() * self:GetValue("ShootEntForce"))
        end
    end
end

function SWEP:GetSpread(baseline)
    local spread = self:GetValue("Spread")

    if self:GetScopeLevel() == 0 then
        spread = spread + self:GetValue("HipFireSpreadPenalty")
    else
        spread = spread + self:GetValue("ScopedSpreadPenalty")
    end

    if baseline then return spread end

    spread = spread + (self:GetRecoilAmount() * self:GetValue("RecoilSpreadPenalty"))

    local spd = math.min(self:GetOwner():GetAbsVelocity():Length(), 250)

    spd = spd / 250

    spread = spread + (spd * self:GetValue("MoveSpreadPenalty"))

    if !self:GetOwner():OnGround() then
        spread = spread + self:GetValue("MidAirSpreadPenalty")
    end

    if self:GetOwner():OnGround() and self:GetOwner():Crouching() then
        spread = spread + self:GetValue("CrouchSpreadPenalty")
    end

    if self:GetBlindFire() then
        spread = spread + self:GetValue("BlindFireSpreadPenalty")
    end

    local quickscopetime = CurTime() - self:GetLastScopeTime()

    local qsd = quickscopetime / self:GetValue("QuickScopeTime")

    if qsd < 1 then
        spread = spread + Lerp(qsd, self:GetValue("QuickScopeSpreadPenalty"), 0)
    end

    spread = math.max(spread, 0)

    return spread
end

function SWEP:FireAnimationEvent( pos, ang, event, options )
    return true
end