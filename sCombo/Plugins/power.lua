-- Power Plugin
local T, C, L = unpack(Tukui)

local O = Options["power"]
if O.power ~= true then return end

local sPowerBG = CreateFrame("Frame", "sPowerBG", UIParent)
sPowerBG:CreatePanel(nil, O.width , O.height, "TOPLEFT", sCombo[1], "BOTTOMLEFT", 0, -3)
sPowerBG.sStatus = CreateFrame("StatusBar", "sStatus", sPowerBG)
sPowerBG.sStatus:SetStatusBarTexture(C.media.normTex)
sPowerBG.sStatus:SetFrameLevel(6)
sPowerBG.sStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 2, -2)
sPowerBG.sStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -2, 2)
sPowerBG.sStatus:SetScript("OnUpdate", function()
    sPowerBG.sStatus:SetMinMaxValues(0, UnitPowerMax("player"))
    sPowerBG.sStatus:SetValue(UnitPower("player"))
	local color = RAID_CLASS_COLORS[T.myclass]
	sPowerBG.sStatus:SetStatusBarColor(color.r, color.g, color.b)
end)
sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")
sPowerBG:RegisterEvent("PLAYER_REGEN_DISABLED")
sPowerBG:RegisterEvent("PLAYER_REGEN_ENABLED")
sPowerBG:RegisterEvent("UNIT_POWER")
sPowerBG:SetScript("OnEvent", function(self, event)
local p, _ = UnitPowerType("player")
    if p == SPELL_POWER_ENERGY then
        if event == "PLAYER_REGEN_DISABLED" then
            sPowerBG:Show()
        elseif event == "UNIT_POWER" then
            if InCombatLockdown() then
                sPowerBG:Show()
            end
        else
            sPowerBG:Hide()
        end
    else
        sPowerBG:Hide()
    end
end)