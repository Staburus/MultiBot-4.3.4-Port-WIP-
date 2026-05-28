-- TrinityCore 4.3.4 / mod-playerbots compatibility (Interface 40300)
MultiBot.MAX_LEVEL = 85

-- Party size API: prefer Cata subgroup API when the legacy helper is missing.
MultiBot.GetPartySize = function()
	if GetNumSubgroupMembers then
		return GetNumSubgroupMembers()
	end
	return GetNumPartyMembers and GetNumPartyMembers() or 0
end

MultiBot.ForEachPartyMember = function(pCallback)
	local tSize = MultiBot.GetPartySize()
	for i = 1, tSize do
		pCallback(i, UnitName("party" .. i))
	end
end
