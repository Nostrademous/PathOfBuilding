-- Path of Building
--
-- Class: PassiveMasteryControl
-- Specialized UI element for selecting timeless jewels by seed
--

local m_random = math.random

local function randomSkipLegacy(lower, upper)
	local rand = m_random(lower, upper)
	if rand == upper then
		return rand + 1
	end
	return rand
end

local TimelessJewelListControlClass = newClass("TimelessJewelListControl", "ListControl", function(self, anchor, x, y, width, height, list, build)
	self.list = list or { }
	self.ListControl(anchor, x, y, width, height, 16, true, false, self.list)
	self.build = build
	self.selIndex = nil
end)

function TimelessJewelListControlClass:Draw(viewPort)
	self.ListControl.Draw(self, viewPort)
end

function TimelessJewelListControlClass:GetRowValue(column, index, data)
	if column == 1 then
		return data.label
	end
end

function TimelessJewelListControlClass:AddValueTooltip(tooltip, index, data)
	tooltip:Clear()
	tooltip:AddLine(16, "^7Double click to add this jewel to your build.")
end

function TimelessJewelListControlClass:OnSelClick(index, data, doubleClick)
	if doubleClick then
		local itemData = [[
Elegant Hubris
Timeless Jewel
League: Legion
Source: Drops from Eternal Legion
Requires Level: 20
Limited to: 1 Historic
Variant: Cadiro
Variant: Victario
Variant: Caspiro
Selected Variant:  ]] .. m_random(1, 3) .. [[
Radius: Large
Implicits: 0
{variant:1}Commissioned ]] .. data.seed .. [[ coins to commemorate Cadiro
{variant:2}Commissioned ]] .. data.seed .. [[ coins to commemorate Victario
{variant:3}Commissioned ]] .. data.seed .. [[ coins to commemorate Caspiro
Passives in radius are Conquered by the Eternal Empire
Historic
]]
		if data.type == 1 then
			itemData = [[
Glorious Vanity
Timeless Jewel
League: Legion
Source: Drops from Vaal Legion
Requires Level: 20
Limited to: 1 Historic
Variant: Doryani
Variant: Xibaqua
Variant: Ahuana
Selected Variant: ]] .. m_random(1, 3) .. [[
Radius: Large
Implicits: 0
{variant:1}Bathed in the blood of ]] .. data.seed .. [[ sacrificed in the name of Doryani
{variant:2}Bathed in the blood of ]] .. data.seed .. [[ sacrificed in the name of Xibaqua
{variant:3}Bathed in the blood of ]] .. data.seed .. [[ sacrificed in the name of Ahuana
Passives in radius are Conquered by the Vaal
Historic
]]
		elseif data.type == 2 then
			itemData = [[
Lethal Pride
Timeless Jewel
League: Legion
Source: Drops from Karui Legion
Requires Level: 20
Limited to: 1 Historic
Variant: Kaom
Variant: Rakiata
Variant: Akoya
Selected Variant: ]] .. m_random(1, 3) .. [[
Radius: Large
Implicits: 0
{variant:1}Commanded leadership over ]] .. data.seed .. [[ warriors under Kaom
{variant:2}Commanded leadership over ]] .. data.seed .. [[ warriors under Rakiata
{variant:3}Commanded leadership over ]] .. data.seed .. [[ warriors under Akoya
Passives in radius are Conquered by the Karui
Historic
]]
		elseif data.type == 3 then
			itemData = [[
Brutal Restraint
Timeless Jewel
League: Legion
Source: Drops from Maraketh Legion
Requires Level: 20
Limited to: 1 Historic
Variant: Asenath
Variant: Nasima
Variant: Balbala
Selected Variant: ]] .. m_random(1, 3) .. [[
Radius: Large
Implicits: 0
{variant:1}Denoted service of ]] .. data.seed .. [[ dekhara in the akhara of Asenath
{variant:2}Denoted service of ]] .. data.seed .. [[ dekhara in the akhara of Nasima
{variant:3}Denoted service of ]] .. data.seed .. [[ dekhara in the akhara of Balbala
Passives in radius are Conquered by the Maraketh
Historic
]]
		elseif data.type == 4 then
			itemData = [[
Militant Faith
Timeless Jewel
League: Legion
Source: Drops from Templar Legion
Requires Level: 20
Limited to: 1 Historic
Has Alt Variant: true
Has Alt Variant Two: true
Variant: Avarius
Variant: Dominus
Variant: Maxarius
Variant: Totem Damage
Variant: Brand Damage
Variant: Channelling Damage
Variant: Area Damage
Variant: Elemental Damage
Variant: Elemental Resistances
Variant: Effect of non-Damaging Ailments
Variant: Elemental Ailment Duration
Variant: Duration of Curses
Variant: Minion Attack and Cast Speed
Variant: Minions Accuracy Rating
Variant: Mana Regen
Variant: Skill Cost
Variant: Non-Curse Aura Effect
Variant: Defences from Shield
Selected Variant: ]] .. m_random(1, 3) .. [[
Selected Alt Variant: ]] .. m_random(4, 18) .. [[
Selected Alt Variant Two: ]] .. m_random(4, 18) .. [[
Radius: Large
Implicits: 0
{variant:1}Carved to glorify ]] .. data.seed .. [[ new faithful converted by High Templar Avarius
{variant:2}Carved to glorify ]] .. data.seed .. [[ new faithful converted by High Templar Dominus
{variant:3}Carved to glorify ]] .. data.seed .. [[ new faithful converted by High Templar Maxarius
{variant:4}4% increased Totem Damage per 10 Devotion
{variant:5}4% increased Brand Damage per 10 Devotion
{variant:6}Channelling Skills deal 4% increased Damage per 10 Devotion
{variant:7}4% increased Area Damage per 10 Devotion
{variant:8}4% increased Elemental Damage per 10 Devotion
{variant:9}+2% to all Elemental Resistances per 10 Devotion
{variant:10}3% increased Effect of non-Damaging Ailments on Enemies per 10 Devotion
{variant:11}4% reduced Elemental Ailment Duration on you per 10 Devotion
{variant:12}4% reduced Duration of Curses on you per 10 Devotion
{variant:13}1% increased Minion Attack and Cast Speed per 10 Devotion
{variant:14}Minions have +60 to Accuracy Rating per 10 Devotion
{variant:15}Regenerate 0.6 Mana per Second per 10 Devotion
{variant:16}1% reduced Cost of Skills per 10 Devotion
{variant:17}1% increased effect of Non-Curse Auras per 10 Devotion
{variant:18}3% increased Defences from Equipped Shield per 10 Devotion
Passives in radius are Conquered by the Templars
Historic
]]
		end
		item = new("Item", itemData)
		self.build.itemsTab:AddItem(item, true)
		self.build.itemsTab:PopulateSlots()
	end
end