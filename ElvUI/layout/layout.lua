local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

-- BUTTON SIZES
E.buttonsize = E.Scale(C["actionbar"].buttonsize)
E.buttonspacing = E.Scale(C["actionbar"].buttonspacing)
E.petbuttonsize = E.Scale(C["actionbar"].petbuttonsize)
E.buttonspacing = E.Scale(C["actionbar"].buttonspacing)
E.minimapsize = E.Scale(178)

--BOTTOM DUMMY FRAME DOES NOTHING BUT HOLDS FRAME POSITIONS
local bottompanel = CreateFrame("Frame", "ElvuiBottomPanel", UIParent)
bottompanel:SetHeight(23)
bottompanel:SetWidth(UIParent:GetWidth() + (E.mult * 2))
bottompanel:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -E.mult, -E.mult)
bottompanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", E.mult, -E.mult)

local mini = CreateFrame("Frame", "ElvuiMinimap", Minimap)
mini:CreatePanel("Default", E.minimapsize, E.minimapsize, "CENTER", Minimap, "CENTER", -0, 0)
mini:ClearAllPoints()
mini:SetPoint("TOPLEFT", E.Scale(-2), E.Scale(2))
mini:SetPoint("BOTTOMRIGHT", E.Scale(2), E.Scale(-2))
mini:SetFrameLevel(2)
ElvuiMinimap:CreateShadow("Default")
TukuiMinimap = ElvuiMinimap -- conversion

-- MINIMAP STAT FRAMES
if ElvuiMinimap then
	local minimapstatsleft = CreateFrame("Frame", "ElvuiMinimapStatsLeft", ElvuiMinimap)
	minimapstatsleft:CreatePanel("Default", (E.minimapsize / 2) - 2, 19, "TOPLEFT", ElvuiMinimap, "BOTTOMLEFT", 0, E.Scale(-3))

	local minimapstatsright = CreateFrame("Frame", "ElvuiMinimapStatsRight", ElvuiMinimap)
	minimapstatsright:CreatePanel("Default", (E.minimapsize / 2) - 2, 19, "TOPRIGHT", ElvuiMinimap, "BOTTOMRIGHT", 0, E.Scale(-3))
	ElvuiMinimapStatsLeft:SetTemplate("Default", true)
	ElvuiMinimapStatsRight:SetTemplate("Default", true)
	ElvuiMinimapStatsLeft:CreateShadow("Default")
	ElvuiMinimapStatsRight:CreateShadow("Default")
	
	TukuiMinimapStatsLeft = ElvuiMinimapStatsLeft -- conversion
	TukuiMinimapStatsRight = ElvuiMinimapStatsRight -- conversion
end

-- MAIN ACTION BAR
local barbg = CreateFrame("Frame", "ElvuiActionBarBackground", UIParent)
if C["actionbar"].bottompetbar ~= true then
	barbg:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, E.Scale(4))
else
	barbg:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, (E.buttonsize + (E.buttonspacing * 2)) + E.Scale(8))
end
barbg:SetWidth(math.ceil((E.buttonsize * 12) + (E.buttonspacing * 13)))
barbg:SetFrameStrata("BACKGROUND")
barbg:SetHeight(E.buttonsize + (E.buttonspacing * 2))
barbg:SetFrameLevel(2)
barbg:CreateShadow("Default")

if C["actionbar"].enable ~= true then
	barbg:SetAlpha(0)
end

--SPLIT BAR PANELS
local splitleft = CreateFrame("Frame", "ElvuiSplitActionBarLeftBackground", ElvuiActionBarBackground)
splitleft:CreatePanel("Default", (E.buttonsize * 6) + (E.buttonspacing * 7), ElvuiActionBarBackground:GetHeight(), "RIGHT", ElvuiActionBarBackground, "LEFT", E.Scale(-4), 0)
splitleft:SetFrameLevel(ElvuiActionBarBackground:GetFrameLevel())
splitleft:SetFrameStrata(ElvuiActionBarBackground:GetFrameStrata())

local splitright = CreateFrame("Frame", "ElvuiSplitActionBarRightBackground", ElvuiActionBarBackground)
splitright:CreatePanel("Default", (E.buttonsize * 6) + (E.buttonspacing * 7), ElvuiActionBarBackground:GetHeight(), "LEFT", ElvuiActionBarBackground, "RIGHT", E.Scale(4), 0)
splitright:SetFrameLevel(ElvuiActionBarBackground:GetFrameLevel())
splitright:SetFrameStrata(ElvuiActionBarBackground:GetFrameStrata())

splitleft:CreateShadow("Default")
splitright:CreateShadow("Default")


-- RIGHT BAR
if C["actionbar"].enable == true then
	local barbgr = CreateFrame("Frame", "ElvuiActionBarBackgroundRight", ElvuiActionBarBackground)
	barbgr:CreatePanel("Default", 1, (E.buttonsize * 12) + (E.buttonspacing * 13), "RIGHT", UIParent, "RIGHT", E.Scale(-4), E.Scale(-8))
	barbgr:SetFrameLevel(2)
	barbgr:Hide()

	local petbg = CreateFrame("Frame", "ElvuiPetActionBarBackground", UIParent)
	if C["actionbar"].bottompetbar ~= true then
		petbg:CreatePanel("Default", E.petbuttonsize + (E.buttonspacing * 2), (E.petbuttonsize * 10) + (E.buttonspacing * 11), "RIGHT", UIParent, "RIGHT", E.Scale(-6), E.Scale(-13.5))
	else
		petbg:CreatePanel("Default", (E.petbuttonsize * 10) + (E.buttonspacing * 11), E.petbuttonsize + (E.buttonspacing * 2), "BOTTOM", UIParent, "BOTTOM", 0, E.Scale(4))
	end
	
	local ltpetbg = CreateFrame("Frame", "ElvuiLineToPetActionBarBackground", petbg)
	if C["actionbar"].bottompetbar ~= true then
		ltpetbg:CreatePanel("Default", 30, 265, "LEFT", petbg, "RIGHT", 0, 0)
		ltpetbg:SetTemplate("Transparent")
	else
		ltpetbg:CreatePanel("Default", 265, 30, "BOTTOM", petbg, "TOP", 0, 0)
		ltpetbg:SetTemplate("Transparent")
	end
	
	ltpetbg:SetScript("OnShow", function(self)
		self:SetFrameStrata("BACKGROUND")
		self:SetFrameLevel(0)
	end)

	
	barbgr:CreateShadow("Default")
	petbg:CreateShadow("Default")
end

-- VEHICLE BAR
if C["actionbar"].enable == true then
	local vbarbg = CreateFrame("Frame", "ElvuiVehicleBarBackground", UIParent)
	vbarbg:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, E.Scale(4))
	vbarbg:SetWidth((E.buttonsize * 12) + (E.buttonspacing * 13))
	vbarbg:SetHeight(E.buttonsize + (E.buttonspacing * 2))
	vbarbg:CreateShadow("Default")
end

-- CHAT BACKGROUND LEFT (MOVES)
local chatlbgdummy = CreateFrame("Frame", "ChatLBackground", UIParent)
chatlbgdummy:SetWidth(C["chat"].chatwidth)
chatlbgdummy:SetHeight(C["chat"].chatheight+6)
chatlbgdummy:SetPoint("BOTTOMLEFT", ElvuiBottomPanel, "TOPLEFT", E.Scale(4),  E.Scale(7))

-- CHAT BACKGROUND LEFT (DOESN'T MOVE THIS IS WHAT WE ATTACH FRAMES TO)
local chatlbgdummy2 = CreateFrame("Frame", "ChatLBackground2", UIParent)
chatlbgdummy2:SetWidth(C["chat"].chatwidth)
chatlbgdummy2:SetHeight(C["chat"].chatheight+6)
chatlbgdummy2:SetPoint("BOTTOMLEFT", ElvuiBottomPanel, "TOPLEFT", E.Scale(4),  E.Scale(7))

-- CHAT BACKGROUND RIGHT (MOVES)
local chatrbgdummy = CreateFrame("Frame", "ChatRBackground", UIParent)
chatrbgdummy:SetWidth(C["chat"].chatwidth)
chatrbgdummy:SetHeight(C["chat"].chatheight+6)
chatrbgdummy:SetPoint("BOTTOMRIGHT", ElvuiBottomPanel, "TOPRIGHT", E.Scale(-4),  E.Scale(7))

-- CHAT BACKGROUND RIGHT (DOESN'T MOVE THIS IS WHAT WE ATTACH FRAMES TO)
local chatrbgdummy2 = CreateFrame("Frame", "ChatRBackground2", UIParent)
chatrbgdummy2:SetWidth(C["chat"].chatwidth)
chatrbgdummy2:SetHeight(C["chat"].chatheight+6)
chatrbgdummy2:SetPoint("BOTTOMRIGHT", ElvuiBottomPanel, "TOPRIGHT", E.Scale(-4),  E.Scale(7))

E.AnimGroup(ChatLBackground, E.Scale(-375), 0, 0.4)
E.AnimGroup(ChatRBackground, E.Scale(375), 0, 0.4)

E.ChatRightShown = true
if C["chat"].showbackdrop == true then
	local chatlbg = CreateFrame("Frame", "ChatLBG", ChatLBackground)
	chatlbg:SetTemplate("Transparent")
	chatlbg:SetAllPoints(chatlbgdummy)
	chatlbg:SetFrameStrata("BACKGROUND")
	
	local chatltbg = CreateFrame("Frame", nil, chatlbg)
	chatltbg:SetTemplate("Default", true)
	chatltbg:SetPoint("BOTTOMLEFT", chatlbg, "TOPLEFT", 0, E.Scale(3))
	chatltbg:SetPoint("BOTTOMRIGHT", chatlbg, "TOPRIGHT", E.Scale(-24), E.Scale(3))
	chatltbg:SetHeight(E.Scale(22))
	chatltbg:SetFrameStrata("BACKGROUND")
	
	chatlbg:CreateShadow("Default")
	chatltbg:CreateShadow("Default")
end

if C["chat"].showbackdrop == true then
	local chatrbg = CreateFrame("Frame", "ChatRBG", ChatRBackground)
	chatrbg:SetAllPoints(chatrbgdummy)
	chatrbg:SetTemplate("Transparent")
	chatrbg:SetFrameStrata("BACKGROUND")
	chatrbg:SetAlpha(0)

	local chatrtbg = CreateFrame("Frame", nil, chatrbg)
	chatrtbg:SetTemplate("Default", true)
	chatrtbg:SetPoint("BOTTOMLEFT", chatrbg, "TOPLEFT", 0, E.Scale(3))
	chatrtbg:SetPoint("BOTTOMRIGHT", chatrbg, "TOPRIGHT", E.Scale(-24), E.Scale(3))
	chatrtbg:SetHeight(E.Scale(22))
	chatrtbg:SetFrameStrata("BACKGROUND")
	chatrbg:CreateShadow("Default")
	chatrtbg:CreateShadow("Default")
end

--INFO LEFT
local infoleft = CreateFrame("Frame", "ElvuiInfoLeft", UIParent)
infoleft:SetFrameLevel(2)
infoleft:SetTemplate("Default", true)
infoleft:CreateShadow("Default")
infoleft:SetPoint("TOPLEFT", chatlbgdummy2, "BOTTOMLEFT", E.Scale(17), E.Scale(-4))
infoleft:SetPoint("BOTTOMRIGHT", chatlbgdummy2, "BOTTOMRIGHT", E.Scale(-17), E.Scale(-26))

	--INFOLEFT L BUTTON
	local infoleftLbutton = CreateFrame("Button", "ElvuiInfoLeftLButton", ElvuiInfoLeft)
	infoleftLbutton:SetTemplate("Default", true)
	infoleftLbutton:SetPoint("TOPRIGHT", infoleft, "TOPLEFT", E.Scale(-2), 0)
	infoleftLbutton:SetPoint("BOTTOMLEFT", chatlbgdummy2, "BOTTOMLEFT", 0, E.Scale(-26))

	--INFOLEFT R BUTTON
	local infoleftRbutton = CreateFrame("Button", "ElvuiInfoLeftRButton", ElvuiInfoLeft)
	infoleftRbutton:SetTemplate("Default", true)
	infoleftRbutton:SetPoint("TOPLEFT", infoleft, "TOPRIGHT", E.Scale(2), 0)
	infoleftRbutton:SetPoint("BOTTOMRIGHT", chatlbgdummy2, "BOTTOMRIGHT", 0, E.Scale(-26))
	
	infoleft.shadow:ClearAllPoints()
	infoleft.shadow:SetPoint("TOPLEFT", infoleftLbutton, "TOPLEFT", E.Scale(-4), E.Scale(4))
	infoleft.shadow:SetPoint("BOTTOMRIGHT", infoleftRbutton, "BOTTOMRIGHT", E.Scale(4), E.Scale(-4))

	infoleftLbutton:FontString(nil, C["media"].font, C["general"].fontscale, "THINOUTLINE")
	infoleftLbutton.text:SetText("<")
	infoleftLbutton.text:SetPoint("CENTER")
	infoleftLbutton.text:SetTextColor(unpack(C["media"].valuecolor))

	infoleftRbutton:FontString(nil, C["media"].font, C["general"].fontscale, "THINOUTLINE")
	infoleftRbutton.text:SetText("L")
	infoleftRbutton.text:SetPoint("CENTER")

--INFO RIGHT
local inforight = CreateFrame("Frame", "ElvuiInfoRight", UIParent)
inforight:SetTemplate("Default", true)
inforight:SetFrameLevel(2)
inforight:CreateShadow("Default")
inforight:SetPoint("TOPLEFT", chatrbgdummy2, "BOTTOMLEFT", E.Scale(17), E.Scale(-4))
inforight:SetPoint("BOTTOMRIGHT", chatrbgdummy2, "BOTTOMRIGHT", E.Scale(-17), E.Scale(-26))

	--INFORIGHT L BUTTON
	local inforightLbutton = CreateFrame("Button", "ElvuiInfoRightLButton", ElvuiInfoRight)
	inforightLbutton:SetTemplate("Default", true)
	inforightLbutton:SetPoint("TOPRIGHT", inforight, "TOPLEFT", E.Scale(-2), 0)
	inforightLbutton:SetPoint("BOTTOMLEFT", chatrbgdummy2, "BOTTOMLEFT", 0, E.Scale(-26))

	--INFORIGHT R BUTTON
	local inforightRbutton = CreateFrame("Button", "ElvuiInfoRightRButton", ElvuiInfoRight)
	inforightRbutton:SetTemplate("Default", true)
	inforightRbutton:SetPoint("TOPLEFT", inforight, "TOPRIGHT", E.Scale(2), 0)
	inforightRbutton:SetPoint("BOTTOMRIGHT", chatrbgdummy2, "BOTTOMRIGHT", 0, E.Scale(-26))
	
	inforight.shadow:ClearAllPoints()
	inforight.shadow:SetPoint("TOPLEFT", inforightLbutton, "TOPLEFT", E.Scale(-4), E.Scale(4))
	inforight.shadow:SetPoint("BOTTOMRIGHT", inforightRbutton, "BOTTOMRIGHT", E.Scale(4), E.Scale(-4))

	inforightLbutton:FontString(nil, C["media"].font, C["general"].fontscale, "THINOUTLINE")
	inforightLbutton.text:SetText("R")
	inforightLbutton.text:SetPoint("CENTER")

	inforightRbutton:FontString(nil, C["media"].font, C["general"].fontscale, "THINOUTLINE")
	inforightRbutton.text:SetText(">")
	inforightRbutton.text:SetPoint("CENTER")
	inforightRbutton.text:SetTextColor(unpack(C["media"].valuecolor))
	
-- Top, Bottom and Coord Panels and datatext for coordinates
	
local UI
if ElvUI then UI=ElvUI else UI=Tukui end
local E, C, L, DB = unpack(UI)
local font = C["media"].font

--Bottom panel
local botpanel = CreateFrame("Frame", "ElvBottomPanel", UIParent)
botpanel:CreatePanel("Default", UIParent:GetWidth() + (E.mult * 2), 16, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", -E.mult, -E.mult)
botpanel:SetPoint("BOTTOMRIGHT", UIParent, "TOPRIGHT", E.mult, -E.mult)
botpanel:SetTemplate("Transparent")
botpanel:CreateShadow("Default")
botpanel:SetFrameLevel(0)
botpanel:SetAlpha(1)


--Top Panels
-------------
--toppannel
local toppanel = CreateFrame("Frame", "ElvTopPanel", UIParent)
toppanel:CreatePanel("Default", UIParent:GetWidth() + (E.mult * 2), 16, "TOPLEFT", UIParent, "TOPLEFT", -E.mult, E.mult)
toppanel:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", E.mult, E.mult)
toppanel:SetTemplate("Transparent")
toppanel:CreateShadow("Default")
toppanel:SetFrameLevel(0)
toppanel:SetAlpha(1)

--loc panels
--topbox is dummy panel for anchoring
local topbox = CreateFrame("Frame", "ElvTopBox", toppanel)
topbox:SetTemplate("Default", true)
topbox:CreateShadow("Default")
topbox:SetFrameLevel(0)
topbox:SetAlpha(0)

local locpanel = CreateFrame("Frame", "ElvLocPanel", UIParent)
locpanel:SetTemplate("Default", true)
locpanel:CreatePanel("Default", 19, 21, "TOP", UIParent, "TOP", 0, -5)
locpanel:CreateShadow("Default")
locpanel:SetFrameLevel(2)
locpanel:EnableMouse(true)

local lxcordpanel = CreateFrame("Frame", "ElvXPanel", UIParent)
lxcordpanel:SetTemplate("Default", true)
lxcordpanel:CreatePanel("Default", 31, 21, "RIGHT", locpanel, "LEFT", -4, 0)
lxcordpanel:CreateShadow("Default")
lxcordpanel:SetFrameLevel(2)

local rycordpanel = CreateFrame("Frame", "ElvYPanel", UIParent)
rycordpanel:SetTemplate("Default", true)
rycordpanel:CreatePanel("Default", 31, 21, "LEFT", locpanel, "RIGHT", 4, 0)
rycordpanel:CreateShadow("Default")
rycordpanel:SetFrameLevel(2)

local ldatapanel = CreateFrame("Frame", "ElvLeftDataPanel", UIParent)
ldatapanel:SetTemplate("Default", true)
ldatapanel:CreateShadow("Default")
ldatapanel:SetFrameLevel(2)

local rdatapanel = CreateFrame("Frame", "ElvRightDataPanel", UIParent)
rdatapanel:SetTemplate("Default", true)
rdatapanel:CreateShadow("Default")
rdatapanel:SetFrameLevel(2)




--Font Strings
----Zone
local locFS = locpanel:CreateFontString(nil, "OVERLAY")
locFS:SetFont(font, C["datatext"].fontsize, "THINOUTLINE")
locFS:SetShadowOffset(E.mult, -E.mult)
locFS:SetShadowColor(0, 0, 0, 0.4)


local xFS = lxcordpanel:CreateFontString(nil, "OVERLAY")
xFS:SetFont(font, C["datatext"].fontsize, "THINOUTLINE")
xFS:SetTextColor(unpack(C["media"].valuecolor))
xFS:SetShadowOffset(E.mult, -E.mult)
xFS:SetShadowColor(0, 0, 0, 0.4)
xFS:SetPoint("CENTER", lxcordpanel, "CENTER", 1, 0)

local yFS = rycordpanel:CreateFontString(nil, "OVERLAY")
yFS:SetFont(font, C["datatext"].fontsize, "THINOUTLINE")
yFS:SetTextColor(unpack(C["media"].valuecolor))
yFS:SetShadowOffset(E.mult, -E.mult)
yFS:SetShadowColor(0, 0, 0, 0.4)
yFS:SetPoint("CENTER", rycordpanel, "CENTER", 1, 0)

local ela,go = 0, false

local cUpdate = function(self,t)
	ela = ela - t
	if ela > 0 then return end
	local x,y = GetPlayerMapPosition("player")
	local xt,yt
	x = math.floor(100*x)
	y = math.floor(100*y)
	if x ==0 and y == 0 then
		xFS:SetText("")
		yFS:SetText("")
		ElvXPanel:SetAlpha(0)
		ElvYPanel:SetAlpha(0)
		ElvTopBox:SetPoint("TOPLEFT", ElvLocPanel, "TOPLEFT", -124, 0)
		ElvTopBox:SetPoint("BOTTOMRIGHT", ElvLocPanel, "BOTTOMRIGHT", 124, 0)
		ElvLeftDataPanel:SetPoint("TOPLEFT", ElvTopBox, "TOPLEFT", 0, 0)
		ElvLeftDataPanel:SetPoint("BOTTOMRIGHT", ElvLocPanel, "BOTTOMLEFT", -4, 0)
		ElvRightDataPanel:SetPoint("TOPRIGHT", ElvTopBox, "TOPRIGHT", 0, 0)
		ElvRightDataPanel:SetPoint("BOTTOMLEFT", ElvLocPanel, "BOTTOMRIGHT", 4, 0)
	else
		if x < 10 then
			xt = "0"..x
		else
			xt = x
		end
		if y < 10 then
			yt = "0"..y
		else
			yt = y
		end
		xFS:SetText(xt)
		yFS:SetText(yt)
		ElvXPanel:SetAlpha(1)
		ElvYPanel:SetAlpha(1)
		ElvTopBox:SetPoint("TOPLEFT", ElvXPanel, "TOPLEFT", -124, 0)
		ElvTopBox:SetPoint("BOTTOMRIGHT", ElvYPanel, "BOTTOMRIGHT", 124, 0)
		ElvLeftDataPanel:SetPoint("TOPLEFT", ElvTopBox, "TOPLEFT", 0, 0)
		ElvLeftDataPanel:SetPoint("BOTTOMRIGHT", ElvXPanel, "BOTTOMLEFT", -4, 0)
		ElvRightDataPanel:SetPoint("TOPRIGHT", ElvTopBox, "TOPRIGHT", 0, 0)
		ElvRightDataPanel:SetPoint("BOTTOMLEFT", ElvYPanel, "BOTTOMRIGHT", 4, 0)
	end
	ela = .2
end

ElvXPanel:SetScript("OnUpdate",cUpdate)

--Pvp Type Coloring
local function SetLocColor(frame, pvpT)
	if (pvpT == "arena" or pvpT == "combat") then
		frame:SetTextColor(1, 0.5, 0)
	elseif pvpT == "friendly" then
		frame:SetTextColor(0, 1, 0)
	elseif pvpT == "contested" then
		frame:SetTextColor(1, 1, 0)
	elseif pvpT == "hostile" then
		frame:SetTextColor(1, 0, 0)
	elseif pvpT == "sanctuary" then
		frame:SetTextColor(0, .9, .9)
	else
		frame:SetTextColor(0, 1, 0)
	end
end

local function OnEvent()
	location = GetMinimapZoneText()
	pvpType = GetZonePVPInfo();
	locFS:SetText(location)
	locpanel:SetWidth(locFS:GetStringWidth() + 22)
	SetLocColor(locFS, pvpType)
	locFS:SetPoint("CENTER", locpanel, "CENTER", 1, 0)
	locFS:SetJustifyH("CENTER")
end
locpanel:SetScript("OnMouseDown", function()
	if WorldMapFrame:IsShown() then
			WorldMapFrame:Hide()
	else
			WorldMapFrame:Show()
	end
end)
locpanel:SetScript("OnEnter", function()
	locFS:SetTextColor(1, 1, 1)
end)
locpanel:SetScript("OnLeave", function()
	pvpType = GetZonePVPInfo();
	SetLocColor(locFS, pvpType)
end)
locpanel:RegisterEvent("ZONE_CHANGED")
locpanel:RegisterEvent("PLAYER_ENTERING_WORLD")
locpanel:RegisterEvent("ZONE_CHANGED_INDOORS")
locpanel:RegisterEvent("ZONE_CHANGED_NEW_AREA")
locpanel:SetScript("OnEvent", OnEvent)
	
TukuiInfoLeft = ElvuiInfoLeft -- conversion
TukuiInfoRight = ElvuiInfoRight -- conversion	