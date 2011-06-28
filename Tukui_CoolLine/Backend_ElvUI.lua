local _, Backend = ...

if Backend.UI ~= "ElvUI" then return end

local E, C, L, DB = unpack(ElvUI)
local cl = Backend.CL

Backend["Defaults"]["Parent"] = "ElvuiActionBarBackground"
Backend["Defaults"]["Font"]   = C["media"]["font"]
Backend["Defaults"]["FontSize"] = C["general"].fontscale
Backend["Defaults"]["ConfFColor"] = C["media"].valuecolor
Backend["Defaults"]["Mult"] = E.mult

Backend["Scale"] = function(l)
    return E.Scale(l)
end

local ifConfig = false
Backend.IfConfig = function()
	return ifConfig
end



local oldSkin = Backend.Skin
Backend.Skin = function(self)
    oldSkin(self)
    self:OnUpdate()
    if self.Config.Expand and self.Config.Docking then
        LeftSplit:HookScript("OnMouseDown", function() self:OnUpdate() end)
        RightSplit:HookScript("OnMouseDown", function() self:OnUpdate() end)
    end
    --E.CreateMover(CoolLine, "CoolLineMover", "CoolLine Frame", true, function(self) Backend:OnUpdate() end)
end

Backend.OnUpdate = function(self)
    if not self.Config.Docking then
		if cl.overlayBtn then cl.overlayBtn:Hide() end
		-- ElvuiMainMenuBar:ClearAllPoints()
		-- ElvuiMainMenuBar:SetPoint("TOPLEFT", 0, 0)
		-- ElvuiMainMenuBar:SetPoint("BOTTOMRIGHT")
		TopMainBar:SetPoint("BOTTOMLEFT", ElvuiMainMenuBar, "TOPLEFT", 0, self.Scale(4))
		TopMainBar:SetPoint("TOPRIGHT", ElvuiMainMenuBar, "TOPRIGHT", 0, self.Scale(19))
		cl:ClearAllPoints()
	else
		self:ToggleConfigBG()
		local isSplitEnabled = E["actionbar"].splitbar and self.Config.Expand
		local parent = isSplitEnabled and ElvuiSplitActionBarRightBackground or self:GetParent()
		self.CLDB.w = isSplitEnabled and
				 ElvuiSplitActionBarRightBackground:GetRight() - ElvuiSplitActionBarLeftBackground:GetLeft() - self.Scale(4)
				 or parent:GetWidth() - self.Scale(4) -- Magic number to match ElvUI's actionbar width
		
		-- ElvuiMainMenuBar:ClearAllPoints()
		-- ElvuiMainMenuBar:SetPoint("TOPLEFT", 0, self.Scale(self.CLDB.h+8))
		-- ElvuiMainMenuBar:SetPoint("BOTTOMRIGHT")
		
		TopMainBar:SetPoint("BOTTOMLEFT", ElvuiMainMenuBar, "TOPLEFT", 0, self.Scale(12)+self.CLDB.h)
		TopMainBar:SetPoint("TOPRIGHT", ElvuiMainMenuBar, "TOPRIGHT", 0, self.Scale(27)+self.CLDB.h)

		cl:updatelook()
		cl:Point("BOTTOMRIGHT", parent, "TOPRIGHT", -2, 4)
	end
end

local oldToggleMovers = E.ToggleMovers
E.ToggleMovers = function()
	ifConfig = not ifConfig
    oldToggleMovers()
	Backend:ToggleConfigBG()
end

-- Modify unitframe movers' strata to not overlap CoolLine config menu
local oldGetBackdrop = getBackdrop
getBackdrop= function(obj, isHeader)
    local bd = oldGetBackdrop(obj, isHeader)
    if not bd then return end
    bd:SetFrameStrata("HIGH")
    return bd
end