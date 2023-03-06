SWEP.StatCache = {}
SWEP.HookCache = {}

SWEP.ExcludeFromRawStats = {
    ["PrintName"] = true,
    ["Description"] = true
}

SWEP.IntegerStats = {
    ["ClipSize"] = true,
    ["Num"] = true,
}

function SWEP:RunHook(val, data)
    if self.HookCache[val] then
        for _, chook in pairs(self.HookCache[val]) do

            local d = chook(self, data)

            if d != nil then
                data = d
            end
        end

        return data
    end

    self.HookCache[val] = {}

    for slot, slottbl in pairs(self.Attachments) do
        if !slottbl.Installed then continue end

        local atttbl = TacInt.GetAttTable(slottbl.Installed)

        if atttbl[val] then

            table.insert(self.HookCache[val], atttbl[val])

            local d = atttbl[val](self, data)

            if d != nil then
                data = d
            end
        end
    end

    return data
end

local emptt = {}

function SWEP:GetValue(val, invert)
	local tbl = self:GetTable()

	local stat = tbl[val]

	if !invert and self.StatCache[val] then
		return self.StatCache[val]
	end

	local priority = 0

	local totalstatbanks = {}
	for slot, slottbl in pairs(self.Attachments) do
		if !slottbl.Installed then continue end
		table.insert(totalstatbanks, TacInt.GetAttTable(slottbl.Installed))
	end

	for slot, slottbl in pairs(self.AttachmentElements) do
		local eles = {}
		for i, k in pairs(self.Attachments) do
			if k.Installed then
				table.Add(eles, k.InstalledElements or emptt)
				local atttbl = TacInt.GetAttTable(k.Installed)
				table.Add(eles, atttbl.InstalledElements or emptt)
			else
				table.Add(eles, k.UnInstalledElements or emptt)
			end
		end
		PrintTable(eles)
		for index, fucker in ipairs(eles) do
			if slot != fucker then continue end
			table.insert(totalstatbanks, slottbl)
		end
	end

	if !self.ExcludeFromRawStats[val] then
		for slot, slottbl in pairs(totalstatbanks) do
			local att_priority = slottbl["Priority_" .. val] or 1

			if slottbl[val] != nil and att_priority > priority then
				stat = slottbl[val]
				priority = att_priority
			end
		end
	end

	for slot, slottbl in pairs(totalstatbanks) do
		local att_priority = slottbl["Override_Priority_" .. val] or 1

		if slottbl["Override_" .. val] != nil and att_priority > priority then
			stat = slottbl["Override_" .. val]
			priority = att_priority
		end

		if isnumber(stat) and slottbl["Add_" .. val] then
			stat = stat + slottbl["Add_" .. val] * (invert and -1 or 1)
		end

		if isnumber(stat) and slottbl["Mult_" .. val] then
			if invert then
				stat = stat / slottbl["Mult_" .. val]
			else
				stat = stat * slottbl["Mult_" .. val]
			end
		end
	end

	if self.IntegerStats[val] then
		stat = math.ceil(stat)
	end

	if !invert then
		self.StatCache[val] = stat
	end

	return stat
end