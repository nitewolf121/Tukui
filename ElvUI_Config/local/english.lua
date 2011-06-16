-- English localization file for enUS and enGB.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvuiConfig", "enUS", true)
if not L then return end

--General
L["General Settings"] = true
	L["ELVUI_DESC"] = "User Interface replacement AddOn for World of Warcraft."
	L["Auto Scale"] = true
		L["Automatically scale the User Interface based on your screen resolution"] = true
	L["Scale"] = true
		L["Controls the scaling of the entire User Interface"] = true
	L["Multisample Protection"] = true
		L["Force the Blizzard Multisample Option to be set to 1x. WARNING: Turning this off will lead to blurry borders"] = true
	L["Class Color Theme"] = true
		L["Style all frame borders to be your class color, color unitframes to class color"] = true
	L["Font Scale"] = true
		L["Set the font scale for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"] = true
	L["Resolution Override"] = true
		L["Set a resolution version to use. By default any screensize > 1440 is considered a High resolution. This effects actionbar/unitframe layouts. If set to None, then it will be automatically determined by your screen size"] = true
		L["Low"] = true
		L["High"] = true
		L["None"] = true
	L["Layout Override"] = true
		L["Force a specific layout to show."] = true
		L["DPS"] = true
		L["Heal"] = true
	L["Sharp Borders"] = true
		L["Enhance the borders on all frames by making a dark outline around the edges. You will probably need to disable this if you do not play in your monitors max resolution."] = true
	L["Upper Frame"] = true
		L["Enable a bar accross the top of the screen, doing this will move the location and coords texts to that bar, and also allow for spaces nine and ten of the datatexts to be used."] = true
	L["Lower Frame"] = true
		L["Enable a bar accross the bottom of the screen, mostly for decoration."] = true
		
--Media
L["Media"] = true
	L["MEDIA_DESC"] = "Setup Textures, Colors, Fonts and Sounds for ElvUI"
	L["Fonts"] = true
		L["Font"] = true
			L["The font that the core of the UI will use"] = true
		L["UnitFrame Font"] = true
			L["The font that unitframes will use"] = true
		L["Combat Text Font"] = true
			L["The font that combat text will use. WARNING: This requires a game restart after changing this option."] = true
		L["Data Text Font"] = true
			L["The font that data text will use."] = true
	L["Textures"] = true
		L["StatusBar Texture"] = true
			L["Texture that gets used on all StatusBars"] = true
		L["Gloss Texture"] = true
			L["This gets used by some objects, unless gloss mode is on."] = true
		L["Glow Border"] = true
			L["Shadow Effect"] = true
		L["Backdrop Texture"] = true
			L["Used on almost all frames"] = true
		L["Glossy Texture Mode"] = true
			L["Glossy texture gets used in all aspects of the UI instead of just on various portions."] = true
	L["Colors"] = true
		L["Border Color"] = true
			L["Main Frame's Border Color"] = true
		L["Backdrop Color"] = true
			L["Main Frame's Backdrop Color"] = true
		L["Backdrop Fade Color"] = true
			L["Faded backdrop color of some frames"] = true
		L["Value Color"] = true
			L["Value color of various text/frame objects"] = true	
	L["Sounds"] = true
		L["Whisper Sound"] = true
			L["Sound that is played when recieving a whisper"] = true
		L["Warning Sound"] = true
			L["Sound that is played when you don't have a buff active"] = true
			
--Nameplates
L["Nameplates"] = true
	L["NAMEPLATE_DESC"] = "Setup options for ElvUI nameplates"
	L["Nameplate Options"] = true
		L["Enable/Disable Nameplates"] = true
	L["Show Health"] = true
		L["Display health values on nameplates, this will also increase the size of the nameplate"] = true
	L["Health Threat Coloring"] = true
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = true
	L["Toggle Combat"] = true
		L["Toggles the nameplates off when not in combat."] = true
	L["Track Auras"] = true
		L["Tracks your debuffs on nameplates."] = true
	L["Track CC Debuffs"] = true
		L["Tracks CC debuffs on nameplates from you or a friendly player"] = true
	L["Display Level"] = true
		L["Display level text on nameplate for nameplates that belong to units that aren't your level."] = true
	L["Width"] = true
		L["Controls the width of the nameplate"] = true
	L["Good Color"] = true
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = true
	L["Bad Color"] = true
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = true
	L["Good Transition Color"] = true
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when gaining threat, for a dps/healer it would be displayed when losing threat"] = true
	L["Bad Transition Color"] = true
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when losing threat, for a dps/healer it would be displayed when gaining threat"] = true
	
--Unitframes
L["Unit Frames"] = true
	L["UF_DESC"] = "Adjust settings for unitframes"
	L["Enable Unitframes"] = true
		L["Controls the size of the unitframe font"] = true
	L["Low Mana Threshold"] = true
		L["Point to warn about low mana"] = true
	L["Target Power on Player Only"] = true
		L["Only display power values on player units"] = true
	L["Focus's Target"] = true
		L["Display the focus unit's target"] = true
	L["Pet's Target"] = true
		L["Display the pet unit's target"] = true
	L["Total HP/MP"] = true
		L["Display the total HP/MP on all available units"] = true
	L["Smooth Bars"] = true
		L["Smoothly transition statusbars when values change"] = true
	L["Character Portrait"] = true
		L["Display character portrait on available frames"] = true
	L["Character Portrait on Health"] = true
		L["Overlay character portrait on the healthbar available frames"] = true
	L["Class Color"] = true
	L["Class Colored Healthbars"] = true
		L["Color unitframes by class"] = true
	L["Class Colored Powerbars"] = true
	L["Color powerbars by class"] = true
	L["Health Color"] = true
		L["Color of the healthbar"] = true
	L["Color Health by Value"] = true
		L["Color the health frame by current ammount of hp remaining"] = true
	L["Custom Backdrop Color"] = true
		L["Enable using the custom backdrop color, otherwise 20% of the current health color gets used"] = true
	L["Health Backdrop Color"] = true
		L["Color of the healthbar's backdrop"] = true
	L["Combat Feedback"] = true
		L["Enable displaying incoming damage/healing on player/target frame"] = true
	L["Debuff Highlighting"] = true
		L["Enable highlighting unitframes when there is a debuff you can dispel"] = true
	L["ClassBar"] = true
		L["Display class specific bar (runebar/totembar/holypowerbar/soulshardbar/eclipsebar)"] = true
	L["Combat Fade"] = true
		L["Fade main unitframes out when not in combat, unless you cast or mouseover the frame"] = true
	L["Powerbar Offset"] = true
		L["Detach and offset the power bar on the main unitframes"] = true
	L["Mini-Powerbar Theme"] = true
		L["Style the unitframes with a smaller powerbar"] = true
	L["Arena Frames"] = true
	L["Boss Frames"] = true
	L["Swing Bar"] = true
		L["Bar that displays time between melee attacks"] = true
	L["Display Aggro"] = true
		L["Enable red glow around the player frame when you have aggro"] = true
		L["Change the frame's border to red when a unit has aggro"] = true
	L["Mini-Classbar Theme"] = true
		L["Make classbars smaller and restyle them"] = true
	L["Powerbar Height"] = true
		L["Set the height of the powerbar, this is void if you don't have powerbar offset set to zero."] = true
	L["Classbar Height"] = true
		L["Set the height of the classbar."] = true
	
L["Frame Sizes"] = true
	L["Controls the size of the frame"] = true
	L["Player/Target Width"] = true
	L["Player/Target Height"] = true
	L["TargetTarget, Focus, FocusTarget, Pet Width"] = true
	L["TargetTarget, Focus, FocusTarget, Pet Height"] = true
	L["Arena/Boss Height"] = true
	L["Arena/Boss Width"] = true
	L["Assist/Tank Width"] = true
	L["Assist/Tank Height"] = true

L["Auras"] = true
	L["Display auras on frame"] = true
	L["Player Buffs"] = true
	L["Player Debuffs"] = true
	L["Target Buffs"] = true
	L["Target Debuffs"] = true
	L["Boss Buffs"] = true
	L["Boss Debuffs"] = true
	L["Arena Buffs"] = true
		L["Display important buffs on the arena unit, these may be changed in the filter section of the config"] = true
	L["Arena Debuffs"] = true
		L["Display important debuffs on the arena unit, these may be changed in the filter section of the config"] = true
	L["Player's Debuffs Only"] = true
		L["Only display debuffs on the target, targettarget, boss, and arena frames that are from yourself"] = true
	L["Aura Timer"] = true
		L["Display aura timer"] = true
	L["Aura Text Scale"] = true
		L["Controls the size of the aura font"] = true
	L["Arena Debuff Filter"] = true
		L["Enable filter for arena debuffs"] = true
	L["TargetTarget Debuffs"] = true
	L["Focus Debuffs"] = true
	L["Player Auras in Row"] = true
	L["Target Auras in Row"] = true
	L["Player Buff Rows"] = true
	L["Player Debuff Rows"] = true
	L["Target Buff Rows"] = true
	L["Target Debuff Rows"] = true	
		L["The ammount of auras displayed in a single row"] = true
		L["Ammount of rows of auras"] = true
	L["Small Frames Auras in Row"] = true
	L["Buff Icon Size"] = true
	
L["Castbar"] = true
	L["Enable/Disable Castbars"] = true
	L["Castbar Latency"] = true
		L["Show latency on player castbar"] = true
	L["Castbar Icons"] = true
		L["Show icons on castbars"] = true
	L["Width Player Castbar"] = true
	L["Width Target Castbar"] = true
	L["Width Focus Castbar"] = true
	L["Height Player Castbar"] = true
	L["Height Target Castbar"] = true
	L["Height Focus Castbar"] = true
		L["The size of the castbar"] = true
	L["Castbar Color"] = true
	L["Color of the castbar"] = true
	L["Interrupt Color"] = true
	L["Color of the castbar when you can't interrupt the cast"] = true
	L["Castbar Ticks"] = true
		L["Display ticks on castbar when you cast a spell that is channeled, this list may be modified under filters"] = true
		
L["Power Colors"] = true
	L["Mana"] = true
	L["Rage"] = true
	L["Focus"] = true
	L["Energy"] = true
	L["Runic Power"] = true
		
--Raidframe
L["Raid Frames"] = true
	L["Enable Raidframes"] = true
	L["RF_DESC"] = "Adjust settings for raidframes"
	L["Size of the buff icon on raidframes"] = true
	L["Raid Buff Display"] = true
		L["Display special buffs on raidframes"] = true	
	L["Fade with Range"] = true
		L["Fade the unit out when they become out of range"] = true
	L["Incoming Heals"] = true
		L["Show predicted incoming heals"] = true
	L["Out of Range Alpha"] = true
	L["Incoming Heals"] = true
		L["Show predicted incoming heals"] = true
	L["Vertical Healthbar"] = true
		L["Healthbar grows vertically instead of horizontally"] = true
	L["Player In Party"] = true
		L["Show the player frame in the party layout"] = true
	L["Maintank"] = true
	L["Mainassist"] = true
		L["Display unit"] = true
	L["Party Pets"] = true
	L["Disable Blizzard Frames"] = true
	L["Health Deficit"] = true
		L["Display health deficit on the frame"] = true
	L["DPS GridMode"] = true
		L["Show the DPS layout in gridmode instead of vertical"] = true
	L["Role"] = true
		L["Show the unit's role (DPS/Tank/healer) Note: Party frames always show this"] = true
	L["Party Target's"] = true
	L["Mouse Glow"] = true
		L["Glow the unitframe to the unit's Reaction/Class when mouseover'd"] = true
	L["25 Man Layout Party"] = true
		L["Use the 25 man layout inside a party group"] = true
	L["Display Debuffs"] = true
	
--Classtimer		
L["Class Timers"] = true
	L["CLASSTIMER_DESC"] = "Adjust settings for classtimers"
	L["Enable Class Timers"] = true
	L["Bar Height"] = true
		L["Controls the height of the bar"] = true
	L["Bar Spacing"] = true
		L["Controls the spacing in between bars"] = true
	L["Icon Position"] = true
		L["0 = Left\n1 = Right\n2 = Outside Left\n3 = Outside Right"] = true
	L["Layout"]	 = true
		L["LAYOUT_DESC"] = "1 - Player, Target, Proc auras in one frame right above player frame\n2 - Player and target auras separated into two frames above player frame\n3 - Player, target and trinket auras separated into three frames above player frame\n4 - Player and trinket auras are shown above player frame and target auras are shown above target frame\n 5 - Everything above player frame, no target debuffs\n 6 - Everything above target frame, no player auras or trinkets."
	L["Spark"] = true
		L["Display spark"] = true
	L["Cast Seperator"] = true
	L["Buff"] = true
	L["Debuff"] = true
	L["Proc"] = true
	
--Actionbar
L["Action Bars"] = true
	L["AB_DESC"] = "Adjust settings for actionbars and cooldown text on action buttons"
	L["Hotkey Text"] = true
		L["Display hotkey text on action buttons"] = true
	L["Right Bar on Mouseover"] = true
		L["Hide the right action bar unless mouseovered"] = true
	L["Shape Shift Bar"] = true
		L["Hide the shape shift action bar"] = true
	L["Shape Shift on Mouseover"] = true
		L["Hide the shape shift action bar unless mouseovered"] = true
	L["Vertical Shape Shift"] = true
		L["Make the shape shift bar grow vertically instead of horizontally"] = true
	L["Display Grid"] = true
		L["Display grid backdrop behind empty buttons"] = true
	L["Pet Bar below main actionbar"] = true
		L["Positions the pet bar below the main actionbar instead of to the right side of the screen"] = true
	L["Button Size"] = true
	L["Button Spacing"] = true
	L["Pet Button Size"] = true
	L["Main actionbar on top"] = true
		L["Positions the main actionbar above all other actionbars"] = true
	L["Macro Text"] = true
	L["Micro Bar"] = true
		L["Display blizzards default microbar, this will disable the right click menu on minimap"] = true
	L["Micro Bar on Mouseover"] = true
		L["Display blizzards default microbar when mouseovered"] = true
	L["Main actionbar above unitframes"] = true
		L["Display the main action bar above standard unit frames"] = true
	L["Cooldown Text"] = true
	L["Threshold"] = true
		L["Threshold before turning text red and displaying decimal places"] = true
	L["Expiring"] = true
		L["This gets displayed when your below the threshold"] = true
	L["Seconds"] = true
	L["Minutes"] = true
	L["Hours"] = true
	L["Days"] = true
	
--Datatext
L["Data Texts"] = true
	L["DATATEXT_DESC"] = "Edit display of informational text on panels"
	L["DATATEXT_POS"] = "\n\n0 - Disabled\n1 - LEFT PANEL, LEFT\n2 - LEFT PANEL, CENTER\n3 - LEFT PANEL, RIGHT\n4 - BOTTOM PANEL, LEFT\n5 - BOTTOM PANEL, LEFT CENTER\n6 - BOTTOM PANEL, RIGHT CENTER\n7 - BOTTOM PANEL, RIGHT\n8 - RIGHT PANEL, LEFT\n9 - RIGHT PANEL, CENTER\n10 - RIGHT PANEL, RIGHT\n11 - MINIMAP LEFT\n12 - MINIMAP RIGHT"
	L["DATATEXT_POS2"] = "\n\n0 - Disabled\n1 - LEFT PANEL, LEFT\n2 - LEFT PANEL, CENTER\n3 - LEFT PANEL, RIGHT\n4 - BOTTOM PANEL, LEFT\n5 - BOTTOM PANEL, LEFT CENTER\n6 - BOTTOM PANEL, RIGHT CENTER\n7 - BOTTOM PANEL, RIGHT\n8 - RIGHT PANEL, LEFT\n9 - RIGHT PANEL, CENTER\n10 - RIGHT PANEL, RIGHT\n11 - MINIMAP LEFT\n12 - MINIMAP RIGHT\n13 - TOPBAR LEFT\n14  - TOPBAR RIGHT"
	L["Text Positions"] = true
	L["Mastery Spell"] = true
		L["Display the mastery spell on the mastery datatext"] = true
	L["BG Text"] = true
		L["Display special datatexts when inside a battleground"] = true
		L["Font size for datatexts"] = true
	L["24-Hour Time"] = true
		L["Display time datatext on a 24 hour time scale"] = true
	L["Local Time"] = true
		L["Display local time instead of server time"] = true
		L["Color the datatext values based on your class"] = true
	L["Stat #1"] = true
		L["Display stat based on your role (Avoidance-Tank, AP-Melee, SP/HP-Caster)"] = true
	L["Durability"] = true
		L["Display your current durability"] = true
	L["Stat #2"] = true
		L["Display stat based on your role (Armor-Tank, Crit-Melee, Crit-Caster)"] = true
	L["System"] = true
		L["Display FPS and Latency"] = true
	L["Time"] = true
		L["Display current time"] = true
	L["Gold"] = true
		L["Display current gold"] = true
	L["Guild"] = true
		L["Display current online people in guild"] = true
	L["Friends"] = true	
		L["Display current online friends"] = true
	L["Bags"] = true
		L["Display ammount of bag space"] = true
	L["DPS"] = true
		L["Display ammount of DPS"] = true
	L["HPS"] = true	
		L["Display ammount of HPS"] = true	
	L["Currency"] = true	
		L["Display current watched items in backpack"] = true
	L["Talent Spec"] = true	
		L["Display current spec"] = true
	L["Mastery"] = true
		L["Display Mastery Rating"] = true
	L["Hit Rating"] = true
		L["Display Hit Rating"] = true
	L["Haste Rating"] = true
		L["Display Haste Rating"] = true
	L["Crit Rating"] = true
		L["Display Critical Strike Rating"] = true
	L["Mana Regen"] = true
		L["Display Mana Regen Rate"] = true
	L["Dodge"] = true
		L["Display dodge chance"] = true
	L["Parry"] = true
		L["Display parry chance"] = true	
	L["Call to Arms"] = true
		L["Display the active roles that will recieve a reward for completing a random dungeon"] = true
	
--chat
L["Chat"] = true
	L["CHAT_DESC"] = "Adjust chat settings"
		L["Play a sound when receiving a whisper, this can be set in media section"] = true
	L["Chat Backdrop"] = true
		L["Display backdrop panels behind chat window"] = true
	L["Chat Width"] = true
		L["Width of chatframe"] = true
	L["Chat Height"] = true
		L["Height of chatframe"] = true
	L["Fade Windows"] = true
		L["Fade chat windows after a long period of no activity"] = true
	L["Sticky Editbox"] = true
		L["When pressing enter to open the chat editbox, display the last known channel"] = true
	L["Toggle Chat In Combat"] = true
		L["When you enter combat, the selected window will toggle out of view"] = true
	L["Chat Bubbles"] = true
		L["Skin Blizzard's Chat Bubbles"] = true
	L["Left"] = true
	L["Right"] = true
	L["Both"] = true

--tooltip
L["Tooltip"] = true	
	L["TT_DESC"] = "Adjust tooltip settings"
	L["Hide Combat"] = true
		L["Hide tooltip when entering combat"] = true
	L["Hide Combat in Raid"] = true
		L["Hide tooltip when entering combat only inside a raid instance"] = true
	L["Hide Buttons"] = true
		L["Hide tooltip when mousing over action buttons"] = true
	L["Hide Unit Frames"] = true
		L["Hide tooltip when mousing over unit frames"] = true
	L["Cursor"] = true
		L["Tooltip anchored to cursor"] = true
	L["Color Reaction"] = true
		L["Always color border of tooltip by unit reaction"] = true
	L["ItemID"] = true
		L["Display itemid on item tooltips"] = true
	L["Who's Targetting?"] = true
		L["Display if anyone in your party/raid is targetting the tooltip unit"] = true
	
--External Addons
L["Skins"] = true
	L["Enable/disable skinning of the entire BlizzardUI."] = true
	L["TOGGLESKIN_DESC"] = "Enable/Disable this skin."
	
	L["Bags"] = true
	L["Reforge Frame"] = true
	L["Calendar Frame"] = true
	L["Achievement Frame"] = true
	L["LF Guild Frame"] = true
	L["Inspect Frame"] = true
	L["KeyBinding Frame"] = true
	L["Guild Bank"] = true
	L["Archaeology Frame"] = true
	L["Guild Control Frame"] = true
	L["Guild Frame"] = true
	L["TradeSkill Frame"] = true
	L["Raid Frame"] = true
	L["Talent Frame"] = true
	L["Glyph Frame"] = true
	L["Auction Frame"] = true
	L["Barbershop Frame"] = true
	L["Macro Frame"] = true
	L["Debug Tools"] = true
	L["Trainer Frame"] = true
	L["Socket Frame"] = true
	L["Achievement Popup Frames"] = true
	L["BG Score"] = true
	L["Merchant Frame"] = true
	L["Mail Frame"] = true
	L["Help Frame"] = true
	L["Trade Frame"] = true
	L["Gossip Frame"] = true
	L["Greeting Frame"] = true
	L["World Map"] = true
	L["Taxi Frame"] = true
	L["LFD Frame"] = true
	L["Quest Frames"] = true
	L["Petition Frame"] = true
	L["Dressing Room"] = true
	L["PvP Frames"] = true
	L["Non-Raid Frame"] = true
	L["Friends"] = true
	L["Spellbook"] = true
	L["Character Frame"] = true
	L["LFR Frame"] = true
	L["Misc Frames"] = true
	L["Tabard Frame"] = true
	L["Guild Registrar"] = true
	L["Time Manager"] = true
	L["Blizzard Skins"] = true
	L["SKIN_DESC"] = "Adjust settings for external addon skins. As well as skinning of default blizzard stuff."
	L["Addon Skins"] = true
	L["Enable this skin"] = true
	L["Embed Right"] = true
	L["EMBED_DESC"] = "Choose an AddOn to embed to the right chat window, tooltip should never cover the addon up, and if you have a hook bar option for your addon the bar should stay above the addon if the chatwindow is animated out"
	L["Hook KLE Bars"] = true
	L["Attach KLE's Bars to the right window"] = true
	L["Hook BigWigs Bars"] = true
	L["Attach BigWigs's Bars to the right window"] = true
	L["Hook DXE Bars"] = true
	L["Attach DXE's Bars to the right window"] = true
	
--Misc
L["Misc"] = true
	L["MISC_DESC"] = "Configure all other options"
	L["General"] = true
	L["PVP Autorelease"] = true
		L["Automatically release body when dead inside a bg"] = true
	L["Hide Error Text"] = true
		L["Hide annoying red error text on center of screen"] = true
	L["Auto Accept Invite"] = true
		L["Automatically accept invite when invited by a friend/guildie"] = true
	L["Loot"] = true
	L["Loot Frame"] = true
		L["Skin loot window"] = true
	L["Loot Roll Frame"] = true
		L["Skin loot roll window"] = true
	L["Auto Greed/DE"] = true
		L["Automatically roll greed or Disenchant on green quality items"] = true
	L["Sell Grays"] = true
		L["Automatically sell gray items when visiting a vendor"] = true
	L["Auto Repair"] = true
		L["Automatically repair when visiting a vendor"] = true
	L["Combat"] = true
	L["Buff Reminder"] = true
		L["Icon at center of screen when you are missing a buff, or you have a buff you shouldn't have"] = true
	L["Buff Reminder Sound"] = true
		L["Play sound when icon is displayed"] = true
	L["Raid Buffs Reminder"] = true
		L["Icons below minimap, displayed inside instances"] = true
	L["Interrupt Announce"] = true
		L["Announce when you interrupt a spell"] = true
	L["Threat Display"] = true
		L["Display threat in the bottomright panel"] = true
	L["Minimap Auras"] = true
		L["Display blizzard skinned auras by the minimap"] = true
	L["All-In-One Bag"] = true
		L["Enable/Disable the All-In-One Bag, you must disable this if you wish to run another bag addon"] = true
	L["Map Skin"] = true
		L["Enable/Disable the map skin"] = true
	L["Vertical"] = true
	L["Horizontal"] = true
	L["Bag Bar on mouseover"] = true
		L["Only show the bag bar when you mouseover it"] = true
	L["Bar Bar Direction"] = true
		L["Set the direction you want the bag bar to grow"] = true
	L["Bag Bar"] = true 
		L["Enable a clickable bar of buttons that allow you to click which bag you wish to open"] = true
L["Filters"] = true
L["SPELL_FILTER_DESC"] = "Filter everything from spell names to nameplate names."
	L["Auras"] = true
	L["Nameplate Names"] = true
	L["Choose Filter"] = true
		L["Choose the filter you want to modify."] = true
		L["Raid Debuffs"] = true
		L["Debuff Blacklist"] = true
		L["Debuff Whitelist"] = true
		L["Arena Buffs"] = true
		L["Target Debuffs (PvP Only)"] = true
		L["Nameplate Blacklist"] = true
		L["Raid Buffs (Heal)"] = true
		L["Raid Buffs (DPS)"] = true
		L["Pet Buffs"] = true
		L["Class Timer (Shared)"] = true
		L["Class Timer (Player)"] = true
		
	L["Filter whether or not a nameplate is shown by the name of the nameplate"] = true
	L["Filter the buffs that get displayed on arena units."] = true
	L["Set buffs that will never get displayed."] = true
	L["These debuffs will always get displayed on the Target Frame, Arena Frames, and Nameplates."] = true
	L["These debuffs only get displayed on the target unit when the unit happens to be an enemy player."] = true
	L["These debuffs will be displayed on your raid frames in addition to any debuff that is dispellable."] = true
	L["These buffs are displayed on the healer raid and party layouts"] = true
	L["These buffs are displayed on the DPS raid and party layouts"] = true
	L["These buffs are displayed on the pet frame"] = true
	L["These buffs are displayed no matter your class you must have a layout enabled that uses trinkets however for them to show"] = true
	L["These buffs/debuffs are displayed as a classtimer, where they get positioned is based on your layout option choice"] = true
	L["These spells when cast will display tick marks on the castbar"] = true
	L["Spells"] = true
	
	L["New name"] = true
		L["Add a new spell name / ID to the list."] = true
	L["Remove ID"] = true
	L["Remove Name"] = true
		L["Remove a name or ID from the list."] = true
	L["New ID"] = true
	L["Not valid spell id"] = true
	
	L["You may only delete spells that you have added. Default spells can be disabled by unchecking the option"] = true
	L["Spell not found in list"] = true
	L["Select Spell"] = true
	L["Enabled"] = true
	L["Color"] = true
	L["Position"] = true
		L["Position where the buff appears on the frame"] = true
	L["Any Unit"] = true
		L["Display the buff if cast by anyone?"] = true
	L["Unit Type"] = true
		L["Only display on this type of unit"] = true
		L["All"] = true
		L["Enemy"] = true
		L["Friendly"] = true
	L["Show Ticks"] = true
		L["Fill only if you want to see line on bar that indicates if its safe to start casting spell and not clip the last tick, also note that this can be different from aura id."] = true
	L["Procs"] = true
	L["You must select a filter first"] = true
	L["To disable set to zero, otherwise set to the amount of times the spell ticks in a cast"] = true
	
	
--Profiles
L["Profiles"] = true
L["CFG_RELOAD"] = "A setting you have changed requires a ReloadUI for changes to take effect, when you are done configing hit Accept to ReloadUI."