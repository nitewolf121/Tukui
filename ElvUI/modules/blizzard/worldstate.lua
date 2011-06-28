local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

if C["general"].upperpanel == true then
	WorldStateAlwaysUpFrame:SetPoint("TOP", E.UIParent, "TOP", -10, -60)
end