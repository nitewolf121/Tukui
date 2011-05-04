local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

local FONT = C["media"].font
local FONTSIZE = 18
local FONTFLAG = "THINOUTLINE"

local function SetModifiedBackdrop(self)
	if C["general"].classcolortheme == true then
		self:SetBackdropBorderColor(unpack(C["media"].bordercolor))		
	else
		self:SetBackdropBorderColor(unpack(C["media"].valuecolor))	
	end
end

local function SetOriginalBackdrop(self)
	local color = RAID_CLASS_COLORS[E.myclass]
	if C["general"].classcolortheme == true then
		self:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		self:SetTemplate("Default")
	end
end

local function SkinButton(f, strip)
	if f:GetName() then
		local l = _G[f:GetName().."Left"]
		local m = _G[f:GetName().."Middle"]
		local r = _G[f:GetName().."Right"]
		
		
		if l then l:SetAlpha(0) end
		if m then m:SetAlpha(0) end
		if r then r:SetAlpha(0) end
	end
	
	
	
	if f.SetNormalTexture then
		f:SetNormalTexture("")
	end
	
	if f.SetHighlightTexture then
		f:SetHighlightTexture("")
	end
	
	if f.SetPushedTexture then
		f:SetPushedTexture("")
	end
	
	if f.SetDisabledTexture then
		f:SetDisabledTexture("")
	end
	
	if strip then
		f:StripTextures()
	end
	
	f:SetTemplate("Default", true)
	
	f:HookScript("OnEnter", SetModifiedBackdrop)
	f:HookScript("OnLeave", SetOriginalBackdrop)
end

local function SkinScrollBar(texture)
	if _G[texture.."BG"] then _G[texture.."BG"]:SetTexture(nil) end
	_G[texture.."Top"]:SetTexture(nil)
	_G[texture.."Bottom"]:SetTexture(nil)
	_G[texture.."Middle"]:SetTexture(nil)
end

--Tab Regions
local tabs = {
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"Left",
	"Middle",
	"Right",
}

local function SkinTab(tab)
	if not tab then return end
	for _, object in pairs(tabs) do
		local tex = _G[tab:GetName()..object]
		tex:SetTexture(nil)
	end
	tab:GetHighlightTexture():SetTexture(nil)
	tab.backdrop = CreateFrame("Frame", nil, tab)
	tab.backdrop:SetTemplate("Default")
	tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
	tab.backdrop:Point("TOPLEFT", 10, -3)
	tab.backdrop:Point("BOTTOMRIGHT", -10, 3)				
end

local function SkinNextPrevButton(btn, horizonal)
	btn:SetTemplate("Default")
	btn:Size(btn:GetWidth() - 7, btn:GetHeight() - 7)	
	
	if horizonal then
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.72, 0.65, 0.29, 0.65, 0.72)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.8, 0.65, 0.35, 0.65, 0.8)
		btn:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)	
	else
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
		if btn:GetDisabledTexture() then
			btn:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
		end
	end
	
	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():Point("TOPLEFT", 2, -2)
	btn:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	btn:GetDisabledTexture():SetAllPoints(btn:GetNormalTexture())
	btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())
	btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

local function SkinRotateButton(btn)
	btn:SetTemplate("Default")
	btn:Size(btn:GetWidth() - 14, btn:GetHeight() - 14)	
	
	btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	
	
	btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	
	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():Point("TOPLEFT", 2, -2)
	btn:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

local function SkinEditBox(frame)
	if _G[frame.."Left"] then _G[frame.."Left"]:Kill() end
	if _G[frame.."Middle"] then _G[frame.."Middle"]:Kill() end
	if _G[frame.."Right"] then _G[frame.."Right"]:Kill() end
	_G[frame]:CreateBackdrop("Default")
end

local function SkinDropDownBox(frame, xtextpos)
	local button = _G[frame:GetName().."Button"]

	frame:StripTextures()
	frame:Width(155)
	
	if not xtextpos then xtextpos = -2 end
	_G[frame:GetName().."Text"]:ClearAllPoints()
	_G[frame:GetName().."Text"]:Point("RIGHT", button, "LEFT", xtextpos, 0)

	
	button:ClearAllPoints()
	button:Point("RIGHT", frame, "RIGHT", -10, 3)
	
	SkinNextPrevButton(button, true)
	
	frame:CreateBackdrop("Default")
	frame.backdrop:Point("TOPLEFT", 20, -2)
	frame.backdrop:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
end

local function SkinCheckBox(frame)
	frame:StripTextures()
	frame:CreateBackdrop("Default")
	frame.backdrop:Point("TOPLEFT", 4, -4)
	frame.backdrop:Point("BOTTOMRIGHT", -4, 4)
	
	frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	frame:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
end

local function SkinCloseButton(f)
	if f.SetNormalTexture then
		f:SetNormalTexture("")
	end

	if f.SetHighlightTexture then
		f:SetHighlightTexture("")
	end

	if f.SetPushedTexture then
		f:SetPushedTexture("")
	end

	if f.SetDisabledTexture then
		f:SetDisabledTexture("")
	end
	f:SetTemplate("Default", true)
	f:Size(18,18)

	local text = f:FontString(nil, FONT, FONTSIZE, FONTFLAG)
	text:Point("TOPRIGHT",f, "TOPRIGHT", -1, 2)
	text:SetText("x")

	f:Point("TOPRIGHT", -4, -4)
	f:HookScript("OnEnter", SetModifiedBackdrop)
	f:HookScript("OnLeave", SetOriginalBackdrop)
end

local ElvuiSkin = CreateFrame("Frame")
ElvuiSkin:RegisterEvent("ADDON_LOADED")
ElvuiSkin:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end

	-- Talent Trees
	if addon == "Blizzard_TalentUI" then
		--PLAYER TALENTS
		local buttons = {
			"PlayerTalentFrameToggleSummariesButton",
			"PlayerTalentFrameActivateButton",
		}
		PlayerTalentFrameToggleSummariesButton:Point("BOTTOM", PlayerTalentFrame, "BOTTOM",0,5)

		for i = 1, #buttons do
			_G[buttons[i]]:StripTextures()
			SkinButton(_G[buttons[i]])
		end

		local StripAllTextures = {
			"PlayerTalentFrame",
			"PlayerTalentFrameInset",
			"PlayerTalentFrameTalents",
			"PlayerTalentFramePanel1",
			"PlayerTalentFramePanel2",
			"PlayerTalentFramePanel3",	
			"PlayerTalentFramePanel1HeaderIcon",
			"PlayerTalentFramePanel2HeaderIcon",
			"PlayerTalentFramePanel3HeaderIcon",
			"PlayerTalentFramePetTalents",
			"PlayerTalentFramePetPanel"
		}

		for _, object in pairs(StripAllTextures) do
			_G[object]:StripTextures()
		end
		
		for i=1, 3 do
			_G["PlayerTalentFramePanel"..i.."SelectTreeButton"]:SetFrameLevel(_G["PlayerTalentFramePanel"..i.."SelectTreeButton"]:GetFrameLevel() + 5)
			_G["PlayerTalentFramePanel"..i.."SelectTreeButton"]:StripTextures(true)
			SkinButton(_G["PlayerTalentFramePanel"..i.."SelectTreeButton"])
		end

		local KillTextures = {
			"PlayerTalentFramePanel1InactiveShadow",
			"PlayerTalentFramePanel2InactiveShadow",
			"PlayerTalentFramePanel3InactiveShadow",
			"PlayerTalentFramePanel1Arrow",
			"PlayerTalentFramePanel2Arrow",
			"PlayerTalentFramePanel3Arrow",
			"PlayerTalentFramePetPanelArrow",
			"PlayerTalentFramePanel1SummaryRoleIcon",
			"PlayerTalentFramePanel2SummaryRoleIcon",
			"PlayerTalentFramePanel3SummaryRoleIcon",
			"PlayerTalentFramePetShadowOverlay",
		}

		for _, texture in pairs(KillTextures) do
			_G[texture]:Kill()
		end

		PlayerTalentFrame:SetTemplate("Transparent")
		PlayerTalentFramePanel1:CreateBackdrop("Transparent")
		PlayerTalentFramePanel1.backdrop:Point( "TOPLEFT", PlayerTalentFramePanel1, "TOPLEFT", 3, -3 )
		PlayerTalentFramePanel1.backdrop:Point( "BOTTOMRIGHT", PlayerTalentFramePanel1, "BOTTOMRIGHT", -3, 3 )
		PlayerTalentFramePanel2:CreateBackdrop("Transparent")
		PlayerTalentFramePanel2.backdrop:Point( "TOPLEFT", PlayerTalentFramePanel2, "TOPLEFT", 3, -3 )
		PlayerTalentFramePanel2.backdrop:Point( "BOTTOMRIGHT", PlayerTalentFramePanel2, "BOTTOMRIGHT", -3, 3 )
		PlayerTalentFramePanel3:CreateBackdrop("Transparent")
		PlayerTalentFramePanel3.backdrop:Point( "TOPLEFT", PlayerTalentFramePanel3, "TOPLEFT", 3, -3 )
		PlayerTalentFramePanel3.backdrop:Point( "BOTTOMRIGHT", PlayerTalentFramePanel3, "BOTTOMRIGHT", -3, 3 )
		PlayerTalentFrame:CreateShadow("Default")
		SkinCloseButton(PlayerTalentFrameCloseButton)

		function talentpairs(inspect,pet)
		   local tab,tal=1,0
		   return function()
			  tal=tal+1
			  if tal>GetNumTalents(tab,inspect,pet) then
				 tal=1
				 tab=tab+1
			  end
			  if tab<=GetNumTalentTabs(inspect,pet) then
				 return tab,tal
			  end
		   end
		end

		--Skin TalentButtons
		local function TalentButtons(self, first, i, j)
			local button = _G["PlayerTalentFramePanel"..i.."Talent"..j]
			local icon = _G["PlayerTalentFramePanel"..i.."Talent"..j.."IconTexture"]

			if first then
				button:StripTextures()
			end
			
			if button.Rank then
				button.Rank:SetFont(FONT, 12, FONTFLAG)
				button.Rank:ClearAllPoints()
				button.Rank:SetPoint("BOTTOMRIGHT")
			end
			
			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				button:StyleButton()
				button.SetHighlightTexture = E.dummy
				button.SetPushedTexture = E.dummy
				button:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				button:GetPushedTexture():SetTexCoord(.08, .92, .08, .92)
				button:GetHighlightTexture():SetAllPoints(icon)
				button:GetPushedTexture():SetAllPoints(icon)
				
				icon:ClearAllPoints()
				icon:SetAllPoints()
				button:SetFrameLevel(button:GetFrameLevel() +1)
				button:CreateBackdrop("Default", true)
			end
		end

		local function TalentSummaryButtons(self, first, active, i, j)
			if active then
				button = _G["PlayerTalentFramePanel"..i.."SummaryActiveBonus1"]
				icon = _G["PlayerTalentFramePanel"..i.."SummaryActiveBonus1Icon"]
			else
				button = _G["PlayerTalentFramePanel"..i.."SummaryBonus"..j]
				icon = _G["PlayerTalentFramePanel"..i.."SummaryBonus"..j.."Icon"]
			end

			if first then
				button:StripTextures()
			end

			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				button:SetFrameLevel(button:GetFrameLevel() +1)
				local frame = CreateFrame("Frame",nil, button)
				frame:CreateBackdrop("Default", true)
				frame:SetFrameLevel(button:GetFrameLevel() -1)
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", icon, "TOPLEFT", 0, 0 )
				frame:Point( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0 )
			end
		end

		for i=1, 2 do
			local tab = _G["PlayerSpecTab"..i]
			if tab then
				local a = tab:GetRegions()
				a:Hide()
				tab:StripTextures()
				tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				
				tab:GetNormalTexture():ClearAllPoints()
				tab:GetNormalTexture():Point("TOPLEFT", 2, -2)
				tab:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)

				tab:CreateBackdrop("Default")
				tab.backdrop:SetAllPoints()
				tab:StyleButton(true)
			end
		end

		--Reposition tabs
		PlayerSpecTab1:ClearAllPoints()
		PlayerSpecTab1:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPRIGHT", 2, -32)
		PlayerSpecTab1.SetPoint = E.dummy
		
		local function TalentSummaryClean(i)
			frame = _G["PlayerTalentFramePanel"..i.."Summary"]
			frame:CreateBackdrop("Default")
			frame:SetFrameLevel(frame:GetFrameLevel() +1)
			local a,b,_,d,_,_,_,_,_,_,_,_,m,_ = frame:GetRegions()
			a:Hide()
			b:Hide()
			d:Hide()
			m:Hide()
		end

		local function TalentHeaderIcon(self, first, i)
			local button = _G["PlayerTalentFramePanel"..i.."HeaderIcon"]
			local icon = _G["PlayerTalentFramePanel"..i.."HeaderIconIcon"]
			local panel = _G["PlayerTalentFramePanel"..i]
			local g = select(7, button:GetRegions())

			if first then
				button:StripTextures()
			end
			
			_G["PlayerTalentFramePanel"..i.."HeaderIconPointsSpent"]:SetFont(FONT, 12, FONTFLAG)

			if icon then
				pointsSpent = select(5, GetTalentTabInfo(i))
				g:ClearAllPoints()
				icon:SetTexCoord(.08, .92, .08, .92)
				button:SetFrameLevel(button:GetFrameLevel() +1)
				button:ClearAllPoints()
				button:Point("TOPLEFT",panel,"TOPLEFT", 4, -4)
				local text = button:FontString(nil, FONT, 12, FONTFLAG)
				text:Point("BOTTOMRIGHT",button, "BOTTOMRIGHT", -1, 2)
				text:SetText(pointsSpent)
				local frame = CreateFrame("Frame",nil, button)
				frame:CreateBackdrop("Default", true)
				frame:SetFrameLevel(button:GetFrameLevel() +1)
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", icon, "TOPLEFT", 0, 0 )
				frame:Point( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0 )
			end
		end		

		for i=1, 3 do
			TalentSummaryClean(i)
			TalentHeaderIcon(nil, true, i)
			for j=1, 2 do
				TalentSummaryButtons(nil, true, true, i, j)
				TalentSummaryButtons(nil, true, false, i, j)
			end
		end

		for tab,talent in talentpairs() do
			TalentButtons(nil, true, tab, talent)
		end

		for i=1, 3 do
			SkinTab(_G["PlayerTalentFrameTab"..i])
		end

		--PET TALENTS
		SkinRotateButton(PlayerTalentFramePetModelRotateLeftButton)
		SkinRotateButton(PlayerTalentFramePetModelRotateRightButton)
		PlayerTalentFramePetModelRotateLeftButton:Point("BOTTOM", PlayerTalentFramePetModel, "BOTTOM", -4, 4)
		PlayerTalentFramePetModelRotateRightButton:Point("TOPLEFT", PlayerTalentFramePetModelRotateLeftButton, "TOPRIGHT", 4, 0)
		PlayerTalentFramePetPanel:CreateBackdrop("Transparent")
		PlayerTalentFramePetPanel.backdrop:Point( "TOPLEFT", PlayerTalentFramePetPanel, "TOPLEFT", 3, -3 )
		PlayerTalentFramePetPanel.backdrop:Point( "BOTTOMRIGHT", PlayerTalentFramePetPanel, "BOTTOMRIGHT", -3, 3 )
		PlayerTalentFramePetModel:CreateBackdrop("Transparent")
		PlayerTalentFramePetModel.backdrop:Point( "TOPLEFT", PlayerTalentFramePetModel, "TOPLEFT")
		PlayerTalentFramePetModel.backdrop:Point( "BOTTOMRIGHT", PlayerTalentFramePetModel, "BOTTOMRIGHT")
		SkinButton(PlayerTalentFrameLearnButton, true)
		SkinButton(PlayerTalentFrameResetButton, true)
		
		local function PetHeaderIcon(self, first)
			local button = _G["PlayerTalentFramePetPanelHeaderIcon"]
			local icon = _G["PlayerTalentFramePetPanelHeaderIconIcon"]
			local panel = _G["PlayerTalentFramePetPanel"]
			local d = select(4, button:GetRegions())

			if first then
				button:StripTextures()
			end

			if icon then
				d:ClearAllPoints()
				pointsSpent = select(5,GetTalentTabInfo( 1, Partycheck, true, 1 ))
				icon:SetTexCoord(.08, .92, .08, .92)
				button:SetFrameLevel(button:GetFrameLevel() +1)
				button:ClearAllPoints()
				button:Point("TOPLEFT",panel,"TOPLEFT", 5, -5)
				local text = button:FontString(nil, FONT, 12, FONTFLAG)
				text:Point("BOTTOMRIGHT",button, "BOTTOMRIGHT", -1, 2)
				text:SetText(pointsSpent)
				local frame = CreateFrame("Frame",nil, button)
				frame:CreateBackdrop("Default", true)
				frame:SetFrameLevel(button:GetFrameLevel() +1)
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", icon, "TOPLEFT", 0, 0 )
				frame:Point( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0 )
			end
		end

		local function PetInfoIcon(self, first)
			local button = _G["PlayerTalentFramePetInfo"]
			local icon = _G["PlayerTalentFramePetIcon"]
			local panel = _G["PlayerTalentFramePetModel"]

			PlayerTalentFramePetDiet:Hide();

			local petFoodList = { GetPetFoodTypes() };
			if #petFoodList > 0 then
				diet = petFoodList[1]
			else
				diet = "None"
			end

			if first then
				button:StripTextures()
			end

			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				button:SetFrameLevel(button:GetFrameLevel() +1)
				button:ClearAllPoints()
				button:Point("BOTTOMLEFT",panel,"TOPLEFT", 0, 10)
				local text = button:FontString(nil, FONT, 12, FONTFLAG)
				text:Point("TOPRIGHT",button, "TOPRIGHT", 0, -10)
				text:SetText(diet)
				local frame = CreateFrame("Frame",nil, button)
				frame:CreateBackdrop("Default", true)
				frame:SetFrameLevel(button:GetFrameLevel() +1)
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", icon, "TOPLEFT", 0, 0 )
				frame:Point( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0 )
			end
		end	

		local function PetTalentButtons(self, first, i)
			local button = _G["PlayerTalentFramePetPanelTalent"..i]
			local icon = _G["PlayerTalentFramePetPanelTalent"..i.."IconTexture"]

			if first then
				button:StripTextures()
			end
			
			if button.Rank then
				button.Rank:SetFont(FONT, 12, FONTFLAG)
				button.Rank:ClearAllPoints()
				button.Rank:SetPoint("BOTTOMRIGHT")
			end
			
			if icon then
				button:StyleButton()
				button.SetHighlightTexture = E.dummy
				button.SetPushedTexture = E.dummy
				button:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				button:GetPushedTexture():SetTexCoord(.08, .92, .08, .92)
				button:GetHighlightTexture():SetAllPoints(icon)
				button:GetPushedTexture():SetAllPoints(icon)
				
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:SetAllPoints()
				button:SetFrameLevel(button:GetFrameLevel() +1)
				button:CreateBackdrop("Default", true)
			end
		end	

		PetInfoIcon(nil, true)
		PetHeaderIcon(nil, true)
		for i=1,GetNumTalents(1,false,true) do
			PetTalentButtons(nil,true,i)
		end

	end

	if addon == "Blizzard_GlyphUI" then

		--GLYPHS TAB
		GlyphFrameSparkleFrame:CreateBackdrop("Default")
		GlyphFrameSparkleFrame.backdrop:Point( "TOPLEFT", GlyphFrameSparkleFrame, "TOPLEFT", 3, -3 )
		GlyphFrameSparkleFrame.backdrop:Point( "BOTTOMRIGHT", GlyphFrameSparkleFrame, "BOTTOMRIGHT", -3, 3 )
		SkinEditBox("GlyphFrameSearchBox")
		SkinDropDownBox(GlyphFrameFilterDropDown, 45)
		
		GlyphFrameBackground:SetParent(GlyphFrameSparkleFrame)
		GlyphFrameBackground:SetPoint("TOPLEFT", 4, -4)
		GlyphFrameBackground:SetPoint("BOTTOMRIGHT", -4, 4)
		
		for i=1, 9 do
			_G["GlyphFrameGlyph"..i]:SetFrameLevel(_G["GlyphFrameGlyph"..i]:GetFrameLevel() + 5)
		end
		
		for i=1, 3 do
			_G["GlyphFrameHeader"..i]:StripTextures()
		end

		local function Glyphs(self, first, i)
			local button = _G["GlyphFrameScrollFrameButton"..i]
			local icon = _G["GlyphFrameScrollFrameButton"..i.."Icon"]

			if first then
				button:StripTextures()
			end

			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				SkinButton(button)
			end
		end

		for i=1, 10 do
			Glyphs(nil, true, i)
		end

		GlyphFrameClearInfoFrameIcon:SetTexCoord(.08, .92, .08, .92)
		GlyphFrameClearInfoFrameIcon:ClearAllPoints()
		GlyphFrameClearInfoFrameIcon:Point("TOPLEFT", 2, -2)
		GlyphFrameClearInfoFrameIcon:Point("BOTTOMRIGHT", -2, 2)
		
		GlyphFrameClearInfoFrame:CreateBackdrop("Default", true)
		GlyphFrameClearInfoFrame.backdrop:SetAllPoints()
		GlyphFrameClearInfoFrame:StyleButton()
		GlyphFrameClearInfoFrame:Size(25, 25)
		
		SkinScrollBar("GlyphFrameScrollFrameScrollBar")

		local StripAllTextures = {
			"GlyphFrameScrollFrame",
			"GlyphFrameSideInset",
			"GlyphFrameScrollFrameScrollChild",
		}

		for _, object in pairs(StripAllTextures) do
			_G[object]:StripTextures()
		end

	end
	
	--Auction House
	if addon == "Blizzard_AuctionUI" then
		AuctionFrame:StripTextures(true)
		AuctionFrame:SetTemplate("Transparent")
		AuctionFrame:CreateShadow("Default")
		
		BrowseFilterScrollFrame:StripTextures()
		BrowseScrollFrame:StripTextures()
		AuctionsScrollFrame:StripTextures()
		BidScrollFrame:StripTextures()
		
		SkinDropDownBox(BrowseDropDown)
		SkinDropDownBox(PriceDropDown)
		SkinDropDownBox(DurationDropDown)
		
		SkinCheckBox(IsUsableCheckButton)
		SkinCheckBox(ShowOnPlayerCheckButton)
		
		--Dress Up Frame
		AuctionDressUpFrame:StripTextures()
		AuctionDressUpFrame:SetTemplate("Transparent")
		AuctionDressUpFrame:Point("TOPLEFT", AuctionFrame, "TOPRIGHT", 2, 0)
		SkinButton(AuctionDressUpFrameResetButton)
		AuctionDressUpFrameCloseButton:StripTextures()
		AuctionDressUpFrameCloseButton:SetNormalTexture(AuctionFrameCloseButton:GetNormalTexture():GetTexture())
		AuctionDressUpFrameCloseButton:SetPushedTexture(AuctionFrameCloseButton:GetPushedTexture():GetTexture())
		AuctionDressUpFrameCloseButton:SetHighlightTexture(AuctionFrameCloseButton:GetHighlightTexture():GetTexture())
		AuctionDressUpFrameCloseButton:SetDisabledTexture(AuctionFrameCloseButton:GetDisabledTexture():GetTexture())
		
		SkinRotateButton(AuctionDressUpModelRotateLeftButton)
		SkinRotateButton(AuctionDressUpModelRotateRightButton)
		AuctionDressUpModelRotateRightButton:Point("TOPLEFT", AuctionDressUpModelRotateLeftButton, "TOPRIGHT", 4, 0)
		
		--Progress Frame
		AuctionProgressFrame:StripTextures()
		AuctionProgressFrame:SetTemplate("Transparent")
		AuctionProgressFrame:CreateShadow("Default")
		AuctionProgressFrameCancelButton:StyleButton()
		AuctionProgressFrameCancelButton:SetTemplate("Default")
		AuctionProgressFrameCancelButton:SetHitRectInsets(0, 0, 0, 0)
		AuctionProgressFrameCancelButton:GetNormalTexture():ClearAllPoints()
		AuctionProgressFrameCancelButton:GetNormalTexture():Point("TOPLEFT", 2, -2)
		AuctionProgressFrameCancelButton:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
		AuctionProgressFrameCancelButton:GetNormalTexture():SetTexCoord(0.67, 0.37, 0.61, 0.26)
		AuctionProgressFrameCancelButton:Size(28, 28)
		AuctionProgressFrameCancelButton:Point("LEFT", AuctionProgressBar, "RIGHT", 8, 0)
		
		AuctionProgressBarIcon:SetTexCoord(0.67, 0.37, 0.61, 0.26)
		
		local backdrop = CreateFrame("Frame", nil, AuctionProgressBarIcon:GetParent())
		backdrop:Point("TOPLEFT", AuctionProgressBarIcon, "TOPLEFT", -2, 2)
		backdrop:Point("BOTTOMRIGHT", AuctionProgressBarIcon, "BOTTOMRIGHT", 2, -2)
		backdrop:SetTemplate("Default")
		AuctionProgressBarIcon:SetParent(backdrop)
		
		AuctionProgressBarText:ClearAllPoints()
		AuctionProgressBarText:SetPoint("CENTER")
		
		AuctionProgressBar:StripTextures()
		AuctionProgressBar:CreateBackdrop("Default")
		AuctionProgressBar:SetStatusBarTexture(C["media"].normTex)
		AuctionProgressBar:SetStatusBarColor(1, 1, 0)
		
		SkinNextPrevButton(BrowseNextPageButton)
		SkinNextPrevButton(BrowsePrevPageButton)
		
		local buttons = {
			"BrowseBidButton",
			"BidBidButton",
			"BrowseBuyoutButton",
			"BidBuyoutButton",
			"BrowseCloseButton",
			"BidCloseButton",
			"BrowseSearchButton",
			"AuctionsCreateAuctionButton",
			"AuctionsCancelAuctionButton",
			"AuctionsCloseButton",
			"BrowseResetButton",
			"AuctionsStackSizeMaxButton",
			"AuctionsNumStacksMaxButton",
		}
		
		for _, button in pairs(buttons) do
			SkinButton(_G[button])
		end
		
		--Fix Button Positions
		AuctionsCancelAuctionButton:Point("RIGHT", AuctionsCloseButton, "LEFT", -4, 0)
		BidBuyoutButton:Point("RIGHT", BidCloseButton, "LEFT", -4, 0)
		BidBidButton:Point("RIGHT", BidBuyoutButton, "LEFT", -4, 0)
		BrowseBuyoutButton:Point("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
		BrowseBidButton:Point("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)		
		AuctionsItemButton:StripTextures()
		AuctionsItemButton:StyleButton()
		AuctionsItemButton:SetTemplate("Default", true)
		BrowseResetButton:Point("TOPLEFT", AuctionFrameBrowse, "TOPLEFT", 81, -74)
		BrowseSearchButton:Point("TOPRIGHT", AuctionFrameBrowse, "TOPRIGHT", 25, -34)
		
		AuctionsItemButton:SetScript("OnUpdate", function()
			if AuctionsItemButton:GetNormalTexture() then
				AuctionsItemButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				AuctionsItemButton:GetNormalTexture():ClearAllPoints()
				AuctionsItemButton:GetNormalTexture():Point("TOPLEFT", 2, -2)
				AuctionsItemButton:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
			end
		end)
		
		local sorttabs = {
			"BrowseQualitySort",
			"BrowseLevelSort",
			"BrowseDurationSort",
			"BrowseHighBidderSort",
			"BrowseCurrentBidSort",
			"BidQualitySort",
			"BidLevelSort",
			"BidDurationSort",
			"BidBuyoutSort",
			"BidStatusSort",
			"BidBidSort",
			"AuctionsQualitySort",
			"AuctionsDurationSort",
			"AuctionsHighBidderSort",
			"AuctionsBidSort",
		}
		
		for _, sorttab in pairs(sorttabs) do
			_G[sorttab.."Left"]:Kill()
			_G[sorttab.."Middle"]:Kill()
			_G[sorttab.."Right"]:Kill()
		end
		
		for i=1, 3 do
			SkinTab(_G["AuctionFrameTab"..i])
		end
		
		for i=1, NUM_FILTERS_TO_DISPLAY do
			local tab = _G["AuctionFilterButton"..i]
			tab:StripTextures()
			tab:StyleButton()
		end
		
		local editboxs = {
			"BrowseName",
			"BrowseMinLevel",
			"BrowseMaxLevel",
			"BrowseBidPriceGold",
			"BrowseBidPriceSilver",
			"BrowseBidPriceCopper",
			"BidBidPriceGold",
			"BidBidPriceSilver",
			"BidBidPriceCopper",
			"AuctionsStackSizeEntry",
			"AuctionsNumStacksEntry",
			"StartPriceGold",
			"StartPriceSilver",
			"StartPriceCopper",
			"BuyoutPriceGold",
			"BuyoutPriceSilver",
			"BuyoutPriceCopper"			
		}
		
		for _, editbox in pairs(editboxs) do
			SkinEditBox(editbox)
			_G[editbox]:SetTextInsets(1, 1, -1, 1)
			if editbox:find("Silver") or editbox:find("Copper") then
				_G[editbox].backdrop:Point("BOTTOMRIGHT", -12, -2)
			end
		end
		BrowseMaxLevel:Point("LEFT", BrowseMinLevel, "RIGHT", 8, 0)
		AuctionsStackSizeEntry.backdrop:SetAllPoints()
		AuctionsNumStacksEntry.backdrop:SetAllPoints()
		
		for i=1, NUM_BROWSE_TO_DISPLAY do
			local button = _G["BrowseButton"..i]
			local icon = _G["BrowseButton"..i.."Item"]
			
			_G["BrowseButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92)
			_G["BrowseButton"..i.."ItemIconTexture"]:ClearAllPoints()
			_G["BrowseButton"..i.."ItemIconTexture"]:Point("TOPLEFT", 2, -2)
			_G["BrowseButton"..i.."ItemIconTexture"]:Point("BOTTOMRIGHT", -2, 2)
			
			icon:StyleButton()
			--TODO: Find a better method to ensure that the icon:GetNormalTexture doesn't return after clicking
			icon:HookScript("OnUpdate", function() icon:GetNormalTexture():Kill() end)
			
			icon:CreateBackdrop("Default")
			icon.backdrop:SetAllPoints()

			button:StripTextures()
			button:StyleButton()
			_G["BrowseButton"..i.."Highlight"] = button:GetHighlightTexture()
			button:GetHighlightTexture():ClearAllPoints()
			button:GetHighlightTexture():Point("TOPLEFT", icon, "TOPRIGHT", 2, 0)
			button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 5)
			button:GetPushedTexture():SetAllPoints(button:GetHighlightTexture())
		end
		
		for i=1, NUM_AUCTIONS_TO_DISPLAY do
			local button = _G["AuctionsButton"..i]
			local icon = _G["AuctionsButton"..i.."Item"]
			
			_G["AuctionsButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92)
			_G["AuctionsButton"..i.."ItemIconTexture"].SetTexCoord = E.dummy
			_G["AuctionsButton"..i.."ItemIconTexture"]:ClearAllPoints()
			_G["AuctionsButton"..i.."ItemIconTexture"]:Point("TOPLEFT", 2, -2)
			_G["AuctionsButton"..i.."ItemIconTexture"]:Point("BOTTOMRIGHT", -2, 2)
			
			icon:StyleButton()
			--TODO: Find a better method to ensure that the icon:GetNormalTexture doesn't return after clicking
			icon:HookScript("OnUpdate", function() icon:GetNormalTexture():Kill() end)
			
			icon:CreateBackdrop("Default")
			icon.backdrop:SetAllPoints()

			button:StripTextures()
			button:StyleButton()
			_G["AuctionsButton"..i.."Highlight"] = button:GetHighlightTexture()
			button:GetHighlightTexture():ClearAllPoints()
			button:GetHighlightTexture():Point("TOPLEFT", icon, "TOPRIGHT", 2, 0)
			button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 5)
			button:GetPushedTexture():SetAllPoints(button:GetHighlightTexture())		
		end
		
		for i=1, NUM_BIDS_TO_DISPLAY do
			local button = _G["BidButton"..i]
			local icon = _G["BidButton"..i.."Item"]
			
			_G["BidButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92)
			_G["BidButton"..i.."ItemIconTexture"]:ClearAllPoints()
			_G["BidButton"..i.."ItemIconTexture"]:Point("TOPLEFT", 2, -2)
			_G["BidButton"..i.."ItemIconTexture"]:Point("BOTTOMRIGHT", -2, 2)
			
			icon:StyleButton()
			icon:HookScript("OnUpdate", function() icon:GetNormalTexture():Kill() end)
			
			icon:CreateBackdrop("Default")
			icon.backdrop:SetAllPoints()

			button:StripTextures()
			button:StyleButton()
			_G["BidButton"..i.."Highlight"] = button:GetHighlightTexture()
			button:GetHighlightTexture():ClearAllPoints()
			button:GetHighlightTexture():Point("TOPLEFT", icon, "TOPRIGHT", 2, 0)
			button:GetHighlightTexture():SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 5)
			button:GetPushedTexture():SetAllPoints(button:GetHighlightTexture())			
		end
		

	end
	
	--BarberShop
	if addon == "Blizzard_BarbershopUI" then
		local buttons = {
			"BarberShopFrameOkayButton",
			"BarberShopFrameCancelButton",
			"BarberShopFrameResetButton",
		}
		BarberShopFrameOkayButton:Point("RIGHT", BarberShopFrameSelector4, "BOTTOM", 2, -50)
		
		for i = 1, #buttons do
			_G[buttons[i]]:StripTextures()
			SkinButton(_G[buttons[i]])
		end
		

		for i = 1, 4 do
			local f = _G["BarberShopFrameSelector"..i]
			local f2 = _G["BarberShopFrameSelector"..i-1]
			SkinNextPrevButton(_G["BarberShopFrameSelector"..i.."Prev"])
			SkinNextPrevButton(_G["BarberShopFrameSelector"..i.."Next"])
			
			if i ~= 1 then
				f:ClearAllPoints()
				f:Point("TOP", f2, "BOTTOM", 0, -3)			
			end
			
			if f then
				f:StripTextures()
			end
		end
		
		BarberShopFrameSelector1:ClearAllPoints()
		BarberShopFrameSelector1:Point("TOP", 0, -12)
		
		BarberShopFrameResetButton:ClearAllPoints()
		BarberShopFrameResetButton:Point("BOTTOM", 0, 12)
	
		BarberShopFrame:StripTextures()
		BarberShopFrame:SetTemplate("Transparent")
		BarberShopFrame:Size(BarberShopFrame:GetWidth() - 30, BarberShopFrame:GetHeight() - 56)
		
		BarberShopFrameMoneyFrame:StripTextures()
		BarberShopFrameMoneyFrame:CreateBackdrop()
		BarberShopFrameBackground:Kill()
		
		BarberShopBannerFrameBGTexture:Kill()
		BarberShopBannerFrame:Kill()
		
		BarberShopAltFormFrameBorder:StripTextures()
		BarberShopAltFormFrame:Point( "BOTTOM", BarberShopFrame, "TOP", 0, 5 )
		BarberShopAltFormFrame:StripTextures()
		BarberShopAltFormFrame:CreateBackdrop("Transparent")
	end
	
	--Macro Frame
	if addon == "Blizzard_MacroUI" then
		SkinCloseButton(MacroFrameCloseButton)
		
		local buttons = {
			"MacroDeleteButton",
			"MacroNewButton",
			"MacroExitButton",
			"MacroEditButton",
			"MacroFrameTab1",
			"MacroFrameTab2",
			"MacroPopupOkayButton",
			"MacroPopupCancelButton",
		}
		
		for i = 1, #buttons do
			_G[buttons[i]]:StripTextures()
			SkinButton(_G[buttons[i]])
		end
		
		for i = 1, 2 do
			tab = _G[format("MacroFrameTab%s", i)]
			tab:Height(22)
		end
		MacroFrameTab1:Point("TOPLEFT", MacroFrame, "TOPLEFT", 85, -39)
		MacroFrameTab2:Point("LEFT", MacroFrameTab1, "RIGHT", 4, 0)
		
	
		-- General
		MacroFrame:StripTextures()
		MacroFrame:SetTemplate("Transparent")
		MacroFrameTextBackground:StripTextures()
		MacroFrameTextBackground:CreateBackdrop()
		MacroButtonScrollFrame:CreateBackdrop()
		MacroPopupFrame:StripTextures()
		MacroPopupFrame:SetTemplate("Transparent")
		MacroPopupScrollFrame:StripTextures()
		MacroPopupScrollFrame:CreateBackdrop()
		MacroPopupScrollFrame.backdrop:Point("TOPLEFT", 51, 2)
		MacroPopupScrollFrame.backdrop:Point("BOTTOMRIGHT", -4, 4)
		MacroPopupEditBox:CreateBackdrop()
		MacroPopupEditBox:StripTextures()
		
		--Reposition edit button
		MacroEditButton:ClearAllPoints()
		MacroEditButton:Point("BOTTOMLEFT", MacroFrameSelectedMacroButton, "BOTTOMRIGHT", 10, 0)
		
		-- Regular scroll bar
		SkinScrollBar("MacroButtonScrollFrame")
		
		MacroPopupFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:Point("TOPLEFT", MacroFrame, "TOPRIGHT", 5, -2)
		end)
		
		-- Big icon
		MacroFrameSelectedMacroButton:StripTextures()
		MacroFrameSelectedMacroButton:StyleButton(true)
		MacroFrameSelectedMacroButton:GetNormalTexture():SetTexture(nil)
		MacroFrameSelectedMacroButton:SetTemplate("Default")
		MacroFrameSelectedMacroButtonIcon:SetTexCoord(.08, .92, .08, .92)
		MacroFrameSelectedMacroButtonIcon:ClearAllPoints()
		MacroFrameSelectedMacroButtonIcon:Point("TOPLEFT", 2, -2)
		MacroFrameSelectedMacroButtonIcon:Point("BOTTOMRIGHT", -2, 2)
		
		-- temporarily moving this text
		MacroFrameCharLimitText:ClearAllPoints()
		MacroFrameCharLimitText:Point("BOTTOM", MacroFrameTextBackground, 0, -70)
		
		-- Skin all buttons
		for i = 1, MAX_ACCOUNT_MACROS do
			local b = _G["MacroButton"..i]
			local t = _G["MacroButton"..i.."Icon"]
			local pb = _G["MacroPopupButton"..i]
			local pt = _G["MacroPopupButton"..i.."Icon"]
			
			if b then
				b:StripTextures()
				b:StyleButton(true)
				
				b:SetTemplate("Default", true)
			end
			
			if t then
				t:SetTexCoord(.08, .92, .08, .92)
				t:ClearAllPoints()
				t:Point("TOPLEFT", 2, -2)
				t:Point("BOTTOMRIGHT", -2, 2)
			end

			if pb then
				pb:StripTextures()
				pb:StyleButton(true)
				
				pb:SetTemplate("Default")					
			end
			
			if pt then
				pt:SetTexCoord(.08, .92, .08, .92)
				pt:ClearAllPoints()
				pt:Point("TOPLEFT", 2, -2)
				pt:Point("BOTTOMRIGHT", -2, 2)
			end
		end
	end		
	
	if addon == "Blizzard_DebugTools" then
		local noscalemult = E.mult * C["general"].uiscale
		local bg = {
		  bgFile = C["media"].blank, 
		  edgeFile = C["media"].blank, 
		  tile = false, tileSize = 0, edgeSize = noscalemult, 
		  insets = { left = -noscalemult, right = -noscalemult, top = -noscalemult, bottom = -noscalemult}
		}
		
		ScriptErrorsFrame:SetBackdrop(bg)
		ScriptErrorsFrame:SetBackdropColor(unpack(C.media.backdropfadecolor))
		ScriptErrorsFrame:SetBackdropBorderColor(unpack(C.media.bordercolor))	

		EventTraceFrame:SetTemplate("Transparent")
		
		local texs = {
			"TopLeft",
			"TopRight",
			"Top",
			"BottomLeft",
			"BottomRight",
			"Bottom",
			"Left",
			"Right",
			"TitleBG",
			"DialogBG",
		}
		
		for i=1, #texs do
			_G["ScriptErrorsFrame"..texs[i]]:SetTexture(nil)
			_G["EventTraceFrame"..texs[i]]:SetTexture(nil)
		end
		
		local bg = {
		  bgFile = C["media"].normTex, 
		  edgeFile = C["media"].blank, 
		  tile = false, tileSize = 0, edgeSize = noscalemult, 
		  insets = { left = -noscalemult, right = -noscalemult, top = -noscalemult, bottom = -noscalemult}
		}
		
		for i=1, ScriptErrorsFrame:GetNumChildren() do
			local child = select(i, ScriptErrorsFrame:GetChildren())
			if child:GetObjectType() == "Button" and not child:GetName() then
				
				SkinButton(child)
				child:SetBackdrop(bg)
				child:SetBackdropColor(unpack(C.media.backdropcolor))
				child:SetBackdropBorderColor(unpack(C.media.bordercolor))	
			end
		end	
	end
	
	-- stuff not in Blizzard load-on-demand
	if addon == "ElvUI" then	
				
		--Spellbook
		do
			SkinCloseButton(SpellBookFrameCloseButton)
			
			local StripAllTextures = {
				"SpellBookFrame",
				"SpellBookFrameInset",
				"SpellBookSpellIconsFrame",
				"SpellBookSideTabsFrame",
				"SpellBookPageNavigationFrame",
			}
			
			local KillTextures = {
				"SpellBookPage1",
				"SpellBookPage2",
			}
			
			for _, object in pairs(StripAllTextures) do
				_G[object]:StripTextures()
			end
			
			for _, texture in pairs(KillTextures) do
				_G[texture]:Kill()
			end
			
			local pagebackdrop = CreateFrame("Frame", nil, SpellBookPage1:GetParent())
			pagebackdrop:SetTemplate("Transparent")
			pagebackdrop:Point("TOPLEFT", SpellBookFrame, "TOPLEFT", 50, -50)
			pagebackdrop:Point("BOTTOMRIGHT", SpellBookPage1, "BOTTOMRIGHT", 15, 35)

			SkinNextPrevButton(SpellBookPrevPageButton)
			SkinNextPrevButton(SpellBookNextPageButton)
			
			--Skin SpellButtons
			local function SpellButtons(self, first)
				for i=1, SPELLS_PER_PAGE do
					local button = _G["SpellButton"..i]
					local icon = _G["SpellButton"..i.."IconTexture"]
					
					if first then
						button:StripTextures()
					end
					
					if _G["SpellButton"..i.."Highlight"] then
						_G["SpellButton"..i.."Highlight"]:SetTexture(1, 1, 1, 0.3)
						_G["SpellButton"..i.."Highlight"]:ClearAllPoints()
						_G["SpellButton"..i.."Highlight"]:SetAllPoints(icon)
					end

					if icon then
						icon:SetTexCoord(.08, .92, .08, .92)
						icon:ClearAllPoints()
						icon:SetAllPoints()
						
						button:SetFrameLevel(button:GetFrameLevel() + 2)
						if not button.backdrop then
							button:CreateBackdrop("Default", true)	
						end
					end	
				end
			end
			SpellButtons(nil, true)
			hooksecurefunc("SpellButton_UpdateButton", SpellButtons)
			
			--Skill Line Tabs
			for i=1, MAX_SKILLLINE_TABS do
				local tab = _G["SpellBookSkillLineTab"..i]
				if tab then
					tab:StripTextures()
					tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
					tab:GetNormalTexture():ClearAllPoints()

					tab:GetNormalTexture():Point("TOPLEFT", 2, -2)
					tab:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
					
					tab:CreateBackdrop("Default")
					tab.backdrop:SetAllPoints()
					tab:StyleButton(true)				
					
					local point, relatedTo, point2, x, y = tab:GetPoint()
					tab:Point(point, relatedTo, point2, 2, y)
				end
			end
			
			SpellBookFrame:SetTemplate("Transparent")
			SpellBookFrame:CreateShadow("Default")
			
			--Profession Tab
			local professionbuttons = {
				"PrimaryProfession1SpellButtonTop",
				"PrimaryProfession1SpellButtonBottom",
				"PrimaryProfession2SpellButtonTop",
				"PrimaryProfession2SpellButtonBottom",
				"SecondaryProfession1SpellButtonLeft",
				"SecondaryProfession1SpellButtonRight",
				"SecondaryProfession2SpellButtonLeft",
				"SecondaryProfession2SpellButtonRight",
				"SecondaryProfession3SpellButtonLeft",
				"SecondaryProfession3SpellButtonRight",
				"SecondaryProfession4SpellButtonLeft",
				"SecondaryProfession4SpellButtonRight",		
			}
			
			for _, button in pairs(professionbuttons) do
				local icon = _G[button.."IconTexture"]
				local button = _G[button]
				button:StripTextures()
				
				if icon then
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:ClearAllPoints()
					icon:Point("TOPLEFT", 2, -2)
					icon:Point("BOTTOMRIGHT", -2, 2)
					
					button:SetFrameLevel(button:GetFrameLevel() + 2)
					if not button.backdrop then
						button:CreateBackdrop("Default", true)	
						button.backdrop:SetAllPoints()
					end
				end					
			end
			
			local professionstatusbars = {
				"PrimaryProfession1StatusBar",	
				"PrimaryProfession2StatusBar",	
				"SecondaryProfession1StatusBar",	
				"SecondaryProfession2StatusBar",	
				"SecondaryProfession3StatusBar",	
				"SecondaryProfession4StatusBar",
			}
			
			for _, statusbar in pairs(professionstatusbars) do
				local statusbar = _G[statusbar]
				statusbar:StripTextures()
				statusbar:SetStatusBarTexture(C["media"].normTex)
				statusbar:SetStatusBarColor(0, 220/255, 0)
				statusbar:CreateBackdrop("Default")
				
				statusbar.rankText:ClearAllPoints()
				statusbar.rankText:SetPoint("CENTER")
			end
			
			--Mounts/Companions
			for i = 1, NUM_COMPANIONS_PER_PAGE do
				local button = _G["SpellBookCompanionButton"..i]
				local icon = _G["SpellBookCompanionButton"..i.."IconTexture"]
				button:StripTextures()
				button:StyleButton(false)
				
				if icon then
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:ClearAllPoints()
					icon:Point("TOPLEFT", 2, -2)
					icon:Point("BOTTOMRIGHT", -2, 2)
					
					button:SetFrameLevel(button:GetFrameLevel() + 2)
					if not button.backdrop then
						button:CreateBackdrop("Default", true)	
						button.backdrop:SetAllPoints()
					end
				end					
			end
			
			SkinButton(SpellBookCompanionSummonButton)
			SpellBookCompanionModelFrame:StripTextures()
			SpellBookCompanionModelFrameShadowOverlay:StripTextures()
			SpellBookCompanionsModelFrame:Kill()
			SpellBookCompanionModelFrame:SetTemplate("Default")
			
			SkinRotateButton(SpellBookCompanionModelFrameRotateRightButton)
			SkinRotateButton(SpellBookCompanionModelFrameRotateLeftButton)
			
			--Bottom Tabs
			for i=1, 5 do
				SkinTab(_G["SpellBookFrameTabButton"..i])
			end
		end
		
		--Character Frame
		do
			SkinCloseButton(CharacterFrameCloseButton)
			
			local slots = {
				"HeadSlot",
				"NeckSlot",
				"ShoulderSlot",
				"BackSlot",
				"ChestSlot",
				"ShirtSlot",
				"TabardSlot",
				"WristSlot",
				"HandsSlot",
				"WaistSlot",
				"LegsSlot",
				"FeetSlot",
				"Finger0Slot",
				"Finger1Slot",
				"Trinket0Slot",
				"Trinket1Slot",
				"MainHandSlot",
				"SecondaryHandSlot",
				"RangedSlot",
			}
			for _, slot in pairs(slots) do
				local icon = _G["Character"..slot.."IconTexture"]
				local slot = _G["Character"..slot]
				slot:StripTextures()
				slot:StyleButton(false)
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:Point("TOPLEFT", 2, -2)
				icon:Point("BOTTOMRIGHT", -2, 2)
				
				slot:SetFrameLevel(slot:GetFrameLevel() + 2)
				slot:CreateBackdrop("Default")
				slot.backdrop:SetAllPoints()
			end
			
			--Strip Textures
			local charframe = {
				"CharacterFrame",
				"CharacterModelFrame",
				"CharacterFrameInset", 
				"CharacterStatsPane",
				"CharacterFrameInsetRight",
				"PaperDollSidebarTabs",
				"PaperDollEquipmentManagerPane",
				"PaperDollFrameItemFlyout",
			}
			
			CharacterFrameExpandButton:Size(CharacterFrameExpandButton:GetWidth() - 7, CharacterFrameExpandButton:GetHeight() - 7)
			SkinNextPrevButton(CharacterFrameExpandButton)
			
			SkinRotateButton(CharacterModelFrameRotateLeftButton)
			SkinRotateButton(CharacterModelFrameRotateRightButton)
			CharacterModelFrameRotateLeftButton:Point("TOPLEFT", CharacterModelFrame, "TOPLEFT", 4, -4)
			CharacterModelFrameRotateRightButton:Point("TOPLEFT", CharacterModelFrameRotateLeftButton, "TOPRIGHT", 4, 0)
			
			--Swap item flyout frame (shown when holding alt over a slot)
			PaperDollFrameItemFlyout:HookScript("OnShow", function()
				PaperDollFrameItemFlyoutButtons:StripTextures()
				
				for i=1, PDFITEMFLYOUT_MAXITEMS do
					local button = _G["PaperDollFrameItemFlyoutButtons"..i]
					local icon = _G["PaperDollFrameItemFlyoutButtons"..i.."IconTexture"]
					if button then
						button:StyleButton(false)
						
						icon:SetTexCoord(.08, .92, .08, .92)
						button:GetNormalTexture():SetTexture(nil)
						
						icon:ClearAllPoints()
						icon:Point("TOPLEFT", 2, -2)
						icon:Point("BOTTOMRIGHT", -2, 2)	
						button:SetFrameLevel(button:GetFrameLevel() + 2)
						if not button.backdrop then
							button:CreateBackdrop("Default")
							button.backdrop:SetAllPoints()			
						end
					end
				end
			end)
			
			--Icon in upper right corner of character frame
			CharacterFramePortrait:Kill()
			CharacterModelFrame:CreateBackdrop("Default")

			local scrollbars = {
				"PaperDollTitlesPaneScrollBar",
				"PaperDollEquipmentManagerPaneScrollBar",
			}
			
			for _, texture in pairs(scrollbars) do
				SkinScrollBar(texture)
			end
			
			for _, object in pairs(charframe) do
				_G[object]:StripTextures()
			end
			
			--Titles
			PaperDollTitlesPane:HookScript("OnShow", function(self)
				for x, object in pairs(PaperDollTitlesPane.buttons) do
					object.BgTop:SetTexture(nil)
					object.BgBottom:SetTexture(nil)
					object.BgMiddle:SetTexture(nil)

					object.Check:SetTexture(nil)
					object.text:SetFont(C["media"].font,C["general"].fontscale)
					object.text.SetFont = E.dummy
				end
			end)
			
			--Equipement Manager
			SkinButton(PaperDollEquipmentManagerPaneEquipSet)
			SkinButton(PaperDollEquipmentManagerPaneSaveSet)
			PaperDollEquipmentManagerPaneEquipSet:Width(PaperDollEquipmentManagerPaneEquipSet:GetWidth() - 8)
			PaperDollEquipmentManagerPaneSaveSet:Width(PaperDollEquipmentManagerPaneSaveSet:GetWidth() - 8)
			PaperDollEquipmentManagerPaneEquipSet:Point("TOPLEFT", PaperDollEquipmentManagerPane, "TOPLEFT", 8, 0)
			PaperDollEquipmentManagerPaneSaveSet:Point("LEFT", PaperDollEquipmentManagerPaneEquipSet, "RIGHT", 4, 0)
			PaperDollEquipmentManagerPaneEquipSet.ButtonBackground:SetTexture(nil)
			PaperDollEquipmentManagerPane:HookScript("OnShow", function(self)
				for x, object in pairs(PaperDollEquipmentManagerPane.buttons) do
					object.BgTop:SetTexture(nil)
					object.BgBottom:SetTexture(nil)
					object.BgMiddle:SetTexture(nil)

					object.Check:SetTexture(nil)
					object.icon:SetTexCoord(.08, .92, .08, .92)
					
					if not object.backdrop then
						object:CreateBackdrop("Default")
					end
					
					object.backdrop:Point("TOPLEFT", object.icon, "TOPLEFT", -2, 2)
					object.backdrop:Point("BOTTOMRIGHT", object.icon, "BOTTOMRIGHT", 2, -2)
					object.icon:SetParent(object.backdrop)

					--Making all icons the same size and position because otherwise BlizzardUI tries to attach itself to itself when it refreshes
					object.icon:SetPoint("LEFT", object, "LEFT", 4, 0)
					object.icon.SetPoint = E.dummy
					object.icon:Size(36, 36)
					object.icon.SetSize = E.dummy
				end
				GearManagerDialogPopup:StripTextures()
				GearManagerDialogPopup:SetTemplate("Transparent")
				GearManagerDialogPopup:Point("LEFT", PaperDollFrame, "RIGHT", 4, 0)
				GearManagerDialogPopupScrollFrame:StripTextures()
				GearManagerDialogPopupEditBox:StripTextures()
				GearManagerDialogPopupEditBox:SetTemplate("Default")
				SkinButton(GearManagerDialogPopupOkay)
				SkinButton(GearManagerDialogPopupCancel)
				
				for i=1, NUM_GEARSET_ICONS_SHOWN do
					local button = _G["GearManagerDialogPopupButton"..i]
					local icon = button.icon
					
					if button then
						button:StripTextures()
						button:StyleButton(true)
						
						icon:SetTexCoord(.08, .92, .08, .92)
						_G["GearManagerDialogPopupButton"..i.."Icon"]:SetTexture(nil)
						
						icon:ClearAllPoints()
						icon:Point("TOPLEFT", 2, -2)
						icon:Point("BOTTOMRIGHT", -2, 2)	
						button:SetFrameLevel(button:GetFrameLevel() + 2)
						if not button.backdrop then
							button:CreateBackdrop("Default")
							button.backdrop:SetAllPoints()			
						end
					end
				end
			end)
			
			--Handle Tabs at bottom of character frame
			for i=1, 4 do
				SkinTab(_G["CharacterFrameTab"..i])
			end
			
			--Buttons used to toggle between equipment manager, titles, and character stats
			local function FixSidebarTabCoords()
				for i=1, #PAPERDOLL_SIDEBARS do
					local tab = _G["PaperDollSidebarTab"..i]
					if tab then
						tab.Highlight:SetTexture(1, 1, 1, 0.3)
						tab.Highlight:Point("TOPLEFT", 3, -4)
						tab.Highlight:Point("BOTTOMRIGHT", -1, 0)
						tab.Hider:SetTexture(0.4,0.4,0.4,0.4)
						tab.Hider:Point("TOPLEFT", 3, -4)
						tab.Hider:Point("BOTTOMRIGHT", -1, 0)
						tab.TabBg:Kill()
						
						if i == 1 then
							for i=1, tab:GetNumRegions() do
								local region = select(i, tab:GetRegions())
								region:SetTexCoord(0.16, 0.86, 0.16, 0.86)
								region.SetTexCoord = E.dummy
							end
						end
						tab:CreateBackdrop("Default")
						tab.backdrop:Point("TOPLEFT", 1, -2)
						tab.backdrop:Point("BOTTOMRIGHT", 1, -2)	
					end
				end
			end
			hooksecurefunc("PaperDollFrame_UpdateSidebarTabs", FixSidebarTabCoords)
			
			--Stat panels, atm it looks like 7 is the max
			for i=1, 7 do
				_G["CharacterStatsPaneCategory"..i]:StripTextures()
			end
			
			--Reputation
			local function UpdateFactionSkins()
				ReputationListScrollFrame:StripTextures()
				for i=1, GetNumFactions() do
					local statusbar = _G["ReputationBar"..i.."ReputationBar"]

					if statusbar then
						statusbar:SetStatusBarTexture(C["media"].normTex)
						
						if not statusbar.backdrop then
							statusbar:CreateBackdrop("Default")
						end
						
						_G["ReputationBar"..i.."Background"]:SetTexture(nil)
						_G["ReputationBar"..i.."LeftLine"]:SetTexture(nil)
						_G["ReputationBar"..i.."BottomLine"]:SetTexture(nil)
						_G["ReputationBar"..i.."ReputationBarHighlight1"]:SetTexture(nil)
						_G["ReputationBar"..i.."ReputationBarHighlight2"]:SetTexture(nil)	
						_G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:SetTexture(nil)
						_G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:SetTexture(nil)
						_G["ReputationBar"..i.."ReputationBarLeftTexture"]:SetTexture(nil)
						_G["ReputationBar"..i.."ReputationBarRightTexture"]:SetTexture(nil)
					end		
				end
				ReputationDetailFrame:StripTextures()
				ReputationDetailFrame:SetTemplate("Transparent")
				ReputationDetailFrame:Point("TOPLEFT", ReputationFrame, "TOPRIGHT", 4, -28)			
			end	
			ReputationFrame:HookScript("OnShow", UpdateFactionSkins)
			hooksecurefunc("ReputationFrame_OnEvent", UpdateFactionSkins)
			
			--Currency
			TokenFrame:HookScript("OnShow", function()
				for i=1, GetCurrencyListSize() do
					local button = _G["TokenFrameContainerButton"..i]
					
					if button then
						button.highlight:Kill()
						button.categoryMiddle:Kill()	
						button.categoryLeft:Kill()	
						button.categoryRight:Kill()
						
						if button.icon then
							button.icon:SetTexCoord(.08, .92, .08, .92)
						end
					end
				end
				TokenFramePopup:StripTextures()
				TokenFramePopup:SetTemplate("Transparent")
				TokenFramePopup:Point("TOPLEFT", TokenFrame, "TOPRIGHT", 4, -28)				
			end)
			
			--Pet
			PetModelFrame:CreateBackdrop("Default")
			PetPaperDollFrameExpBar:StripTextures()
			PetPaperDollFrameExpBar:SetStatusBarTexture(C["media"].normTex)
			PetPaperDollFrameExpBar:CreateBackdrop("Default")
			SkinRotateButton(PetModelFrameRotateRightButton)
			SkinRotateButton(PetModelFrameRotateLeftButton)
			PetModelFrameRotateRightButton:ClearAllPoints()
			PetModelFrameRotateRightButton:Point("LEFT", PetModelFrameRotateLeftButton, "RIGHT", 4, 0)
			
			local xtex = PetPaperDollPetInfo:GetRegions()
			xtex:SetTexCoord(.12, .63, .15, .55)
			PetPaperDollPetInfo:CreateBackdrop("Default")
			PetPaperDollPetInfo:Size(24, 24)
		end
		
		
		-- Blizzard frame we want to reskin
		local skins = {
			"StaticPopup1",
			"StaticPopup2",
			"StaticPopup3",
			"GameMenuFrame",
			"InterfaceOptionsFrame",
			"VideoOptionsFrame",
			"AudioOptionsFrame",
			"LFDDungeonReadyStatus",
			"BNToastFrame",
			"TicketStatusFrameButton",
			"DropDownList1MenuBackdrop",
			"DropDownList2MenuBackdrop",
			"DropDownList1Backdrop",
			"DropDownList2Backdrop",
			"LFDSearchStatus",
			"AutoCompleteBox",
			"ConsolidatedBuffsTooltip",
			"ReadyCheckFrame",
			"StackSplitFrame",
			"CharacterFrame",
		}
		
		for i = 1, getn(skins) do
			_G[skins[i]]:SetTemplate("Transparent")
			if _G[skins[i]] ~= _G["GhostFrameContentsFrame"] or _G[skins[i]] ~= _G["AutoCompleteBox"] then -- frame to blacklist from create shadow function
				_G[skins[i]]:CreateShadow("Default")
			end
		end
	
		
		local ChatMenus = {
			"ChatMenu",
			"EmoteMenu",
			"LanguageMenu",
			"VoiceMacroMenu",		
		}
		--
		for i = 1, getn(ChatMenus) do
			if _G[ChatMenus[i]] == _G["ChatMenu"] then
				_G[ChatMenus[i]]:HookScript("OnShow", function(self) self:SetTemplate("Default", true) self:SetBackdropColor(unpack(C["media"].backdropfadecolor)) self:ClearAllPoints() self:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 0, E.Scale(30)) end)
			else
				_G[ChatMenus[i]]:HookScript("OnShow", function(self) self:SetTemplate("Default", true) self:SetBackdropColor(unpack(C["media"].backdropfadecolor)) end)
			end
		end
		
		-- reskin popup buttons
		for i = 1, 2 do
			for j = 1, 3 do
				SkinButton(_G["StaticPopup"..i.."Button"..j])
			end
		end
		
		-- reskin all esc/menu buttons
		local BlizzardMenuButtons = {
			"Options", 
			"SoundOptions", 
			"UIOptions", 
			"Keybindings", 
			"Macros",
			"Ratings",
			"AddOns", 
			"Logout", 
			"Quit", 
			"Continue", 
			"MacOptions",
			"Help"
		}
		
		for i = 1, getn(BlizzardMenuButtons) do
			local ElvuiMenuButtons = _G["GameMenuButton"..BlizzardMenuButtons[i]]
			if ElvuiMenuButtons then
				SkinButton(ElvuiMenuButtons)
			end
		end
		
		if IsAddOnLoaded("OptionHouse") then
			SkinButton(GameMenuButtonOptionHouse)
		end
		
		-- skin return to graveyard button
		do
			SkinButton(GhostFrame)
			GhostFrame:SetBackdropColor(0,0,0,0)
			GhostFrame:SetBackdropBorderColor(0,0,0,0)
			GhostFrame.SetBackdropColor = E.dummy
			GhostFrame.SetBackdropBorderColor = E.dummy
			GhostFrame:ClearAllPoints()
			GhostFrame:SetPoint("TOP", UIParent, "TOP", 0, -150)
			SkinButton(GhostFrameContentsFrame)
			GhostFrameContentsFrameIcon:SetTexture(nil)
			local x = CreateFrame("Frame", nil, GhostFrame)
			x:SetFrameStrata("MEDIUM")
			x:SetTemplate("Default")
			x:SetPoint("TOPLEFT", GhostFrameContentsFrameIcon, "TOPLEFT", E.Scale(-2), E.Scale(2))
			x:SetPoint("BOTTOMRIGHT", GhostFrameContentsFrameIcon, "BOTTOMRIGHT", E.Scale(2), E.Scale(-2))
			local tex = x:CreateTexture(nil, "OVERLAY")
			tex:SetTexture("Interface\\Icons\\spell_holy_guardianspirit")
			tex:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			tex:SetPoint("TOPLEFT", x, "TOPLEFT", E.Scale(2), E.Scale(-2))
			tex:SetPoint("BOTTOMRIGHT", x, "BOTTOMRIGHT", E.Scale(-2), E.Scale(2))
		end
		
		-- hide header textures and move text/buttons.
		local BlizzardHeader = {
			"GameMenuFrame", 
			"InterfaceOptionsFrame", 
			"AudioOptionsFrame", 
			"VideoOptionsFrame",
		}
		
		for i = 1, getn(BlizzardHeader) do
			local title = _G[BlizzardHeader[i].."Header"]			
			if title then
				title:SetTexture("")
				title:ClearAllPoints()
				if title == _G["GameMenuFrameHeader"] then
					title:SetPoint("TOP", GameMenuFrame, 0, 7)
				else
					title:SetPoint("TOP", BlizzardHeader[i], 0, 0)
				end
			end
		end
		
		-- here we reskin all "normal" buttons
		local BlizzardButtons = {
			"VideoOptionsFrameOkay", 
			"VideoOptionsFrameCancel", 
			"VideoOptionsFrameDefaults", 
			"VideoOptionsFrameApply", 
			"AudioOptionsFrameOkay", 
			"AudioOptionsFrameCancel", 
			"AudioOptionsFrameDefaults", 
			"InterfaceOptionsFrameDefaults", 
			"InterfaceOptionsFrameOkay", 
			"InterfaceOptionsFrameCancel",
			"ReadyCheckFrameYesButton",
			"ReadyCheckFrameNoButton",
			"StackSplitOkayButton",
			"StackSplitCancelButton",
			"RolePollPopupAcceptButton"
		}
		
		for i = 1, getn(BlizzardButtons) do
			local ElvuiButtons = _G[BlizzardButtons[i]]
			if ElvuiButtons then
				SkinButton(ElvuiButtons)
			end
		end
		
		-- if a button position is not really where we want, we move it here
		_G["VideoOptionsFrameCancel"]:ClearAllPoints()
		_G["VideoOptionsFrameCancel"]:SetPoint("RIGHT",_G["VideoOptionsFrameApply"],"LEFT",-4,0)		 
		_G["VideoOptionsFrameOkay"]:ClearAllPoints()
		_G["VideoOptionsFrameOkay"]:SetPoint("RIGHT",_G["VideoOptionsFrameCancel"],"LEFT",-4,0)	
		_G["AudioOptionsFrameOkay"]:ClearAllPoints()
		_G["AudioOptionsFrameOkay"]:SetPoint("RIGHT",_G["AudioOptionsFrameCancel"],"LEFT",-4,0)
		_G["InterfaceOptionsFrameOkay"]:ClearAllPoints()
		_G["InterfaceOptionsFrameOkay"]:SetPoint("RIGHT",_G["InterfaceOptionsFrameCancel"],"LEFT", -4,0)
		_G["ReadyCheckFrameYesButton"]:SetParent(_G["ReadyCheckFrame"])
		_G["ReadyCheckFrameNoButton"]:SetParent(_G["ReadyCheckFrame"]) 
		_G["ReadyCheckFrameYesButton"]:SetPoint("RIGHT", _G["ReadyCheckFrame"], "CENTER", -1, 0)
		_G["ReadyCheckFrameNoButton"]:SetPoint("LEFT", _G["ReadyCheckFrameYesButton"], "RIGHT", 3, 0)
		_G["ReadyCheckFrameText"]:SetParent(_G["ReadyCheckFrame"])	
		_G["ReadyCheckFrameText"]:ClearAllPoints()
		_G["ReadyCheckFrameText"]:SetPoint("TOP", 0, -12)
		
		-- others
		_G["ReadyCheckListenerFrame"]:SetAlpha(0)
		_G["ReadyCheckFrame"]:HookScript("OnShow", function(self) if UnitIsUnit("player", self.initiator) then self:Hide() end end) -- bug fix, don't show it if initiator
 		_G["StackSplitFrame"]:GetRegions():Hide()
		_G["StaticPopup1EditBoxLeft"]:SetTexture(nil)
		_G["StaticPopup1EditBoxMid"]:SetTexture(nil)
		_G["StaticPopup1EditBoxRight"]:SetTexture(nil)
		
		--Create backdrop for static popup editbox	
		local bg = CreateFrame("Frame", nil, StaticPopup1EditBox)
		bg:Point("TOPLEFT", StaticPopup1EditBox, "TOPLEFT", -2, -2)
		bg:Point("BOTTOMRIGHT", StaticPopup1EditBox, "BOTTOMRIGHT", 2, 2)
		bg:SetFrameLevel(StaticPopup1EditBox:GetFrameLevel())
		bg:SetTemplate("Default")
		
		RolePollPopup:SetTemplate("Transparent")
		RolePollPopup:CreateShadow("Default")
		LFDDungeonReadyDialog:SetTemplate("Transparent")
		LFDDungeonReadyDialog:CreateShadow("Default")
		SkinButton(LFDDungeonReadyDialogEnterDungeonButton)
		SkinButton(LFDDungeonReadyDialogLeaveQueueButton)
	end
		
	-- mac menu/option panel, made by affli.
	if IsMacClient() then
		-- Skin main frame and reposition the header
		MacOptionsFrame:SetTemplate("Default", true)
		MacOptionsFrameHeader:SetTexture("")
		MacOptionsFrameHeader:ClearAllPoints()
		MacOptionsFrameHeader:SetPoint("TOP", MacOptionsFrame, 0, 0)
 
		--Skin internal frames
		MacOptionsFrameMovieRecording:SetTemplate("Default", true)
		MacOptionsITunesRemote:SetTemplate("Default", true)
 
		--Skin buttons
		SkinButton(_G["MacOptionsFrameCancel"])
		SkinButton(_G["MacOptionsFrameOkay"])
		SkinButton(_G["MacOptionsButtonKeybindings"])
		SkinButton(_G["MacOptionsFrameDefaults"])
		SkinButton(_G["MacOptionsButtonCompress"])
 
		--Reposition and resize buttons
		local tPoint, tRTo, tRP, tX, tY =  _G["MacOptionsButtonCompress"]:GetPoint()
		_G["MacOptionsButtonCompress"]:SetWidth(136)
		_G["MacOptionsButtonCompress"]:ClearAllPoints()
		_G["MacOptionsButtonCompress"]:SetPoint(tPoint, tRTo, tRP, E.Scale(4), tY)
 
		_G["MacOptionsFrameCancel"]:SetWidth(96)
		_G["MacOptionsFrameCancel"]:SetHeight(22)
		tPoint, tRTo, tRP, tX, tY =  _G["MacOptionsFrameCancel"]:GetPoint()
		_G["MacOptionsFrameCancel"]:ClearAllPoints()
		_G["MacOptionsFrameCancel"]:SetPoint(tPoint, tRTo, tRP, E.Scale(-14), tY)
 
		_G["MacOptionsFrameOkay"]:ClearAllPoints()
		_G["MacOptionsFrameOkay"]:SetWidth(96)
		_G["MacOptionsFrameOkay"]:SetHeight(22)
		_G["MacOptionsFrameOkay"]:SetPoint("LEFT",_G["MacOptionsFrameCancel"],E.Scale(-99),0)
 
		_G["MacOptionsButtonKeybindings"]:ClearAllPoints()
		_G["MacOptionsButtonKeybindings"]:SetWidth(96)
		_G["MacOptionsButtonKeybindings"]:SetHeight(22)
		_G["MacOptionsButtonKeybindings"]:SetPoint("LEFT",_G["MacOptionsFrameOkay"],E.Scale(-99),0)
 
		_G["MacOptionsFrameDefaults"]:SetWidth(96)
		_G["MacOptionsFrameDefaults"]:SetHeight(22)

		-- why these buttons is using game menu template? oO
		_G["MacOptionsButtonCompressLeft"]:SetAlpha(0)
		_G["MacOptionsButtonCompressMiddle"]:SetAlpha(0)
		_G["MacOptionsButtonCompressRight"]:SetAlpha(0)
		_G["MacOptionsButtonKeybindingsLeft"]:SetAlpha(0)
		_G["MacOptionsButtonKeybindingsMiddle"]:SetAlpha(0)
		_G["MacOptionsButtonKeybindingsRight"]:SetAlpha(0)
	end
end)