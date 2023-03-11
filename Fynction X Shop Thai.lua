lib = loadstring(game:HttpGet('https://pastebin.com/raw/bTvAab4t'))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes
local Mouse = Player:GetMouse()
local Enemies = workspace.Enemies

TeamMode = 'Marines' or _G.Team

if Player.Team == nil then
	Player.PlayerGui.Main.ChooseTeam.Container[TeamMode].Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
	Player.PlayerGui.Main.ChooseTeam.Container[TeamMode].Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
	Player.PlayerGui.Main.ChooseTeam.Container[TeamMode].Frame.ViewportFrame.TextButton.BackgroundTransparency = 0.5
	wait(.1)
	game:GetService("VirtualInputManager"):SendMouseButtonEvent(99,99,0,true,Player.PlayerGui.Main.ChooseTeam.Container,0)
	game:GetService("VirtualInputManager"):SendMouseButtonEvent(99,99,0,false,Player.PlayerGui.Main.ChooseTeam.Container,0)
	game:GetService('VirtualInputManager'):SendTouchEvent(0,1,99,99)
	game:GetService('VirtualInputManager'):SendTouchEvent(0,0,99,99)
end

win = lib:New({
  Name = 'Fynction X',
  FolderToSave = 'FynctionX'
})

local tab = win:Tab('หลัก')
local main = tab:Section('หลัก')
color_label = main:Label('')
main:Button('เช็ก', function()
	color_label:Set('กำลังเช็ก...')
	local colors = { ['Orange Soda'] = 'ส้มแดง',['Bright Yellow'] = 'เหลืองเข้ม', ['Yellow Sunshine'] = 'เหลืองอ่อน',['Slimy Green'] = 'เขียวอ่อน',['Green Lizard'] = 'เขียวเข้ม',['Blue Jeans'] = 'ฟ้า',['Plump Purple'] = 'ม่วง',['Fiery Rose'] = 'ชมพู',['Heat Wave'] = 'ส้ม',['Absolute Zero'] = 'น้ำเงิน',['Snow White'] = 'ขาว',['Pure Red'] = 'แดง',['Winter Sky'] = 'ม่วงแดง' }
	local swords = { ['Shisui'] = 'ซูซุย', ['Wando'] = 'วาโด', ['Saddi'] = 'ซังได'}
	local a,b = Remotes.CommF_:InvokeServer("ColorsDealer","1")
	local c = Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
	if a == '' or b == nil  or b == '' or a == nil then
		a = 'ไม่มี Npc ขายสีฮาคิ'
		b = ''
	else
		a = 'สี: '..string.format('%q',colors[a])
		b = 'ราคา: '..b
	end
	if c == '' or c == nil then
		c = 'ไม่มี Npc ขายดาบ'
	else
		c = 'ดาบ: '..string.format('%q',swords[c])
	end
	wait()
	color_label:Set(a..' '..b..'\n'..c)
end)

local colors = tab:Section('สีฮาคิ')
colors:MultiDropdown('เลือกสี', { 'ส้มแดง', 'เหลืองเข้ม', 'เหลืองอ่อน', 'เขียวอ่อน','เขียวเข้ม','ฟ้า','ม่วง','ชมพู','ส้ม','น้ำเงิน','ขาว','แดง','ม่วงแดง' },{},'Dropdown', function(t)
	scs = {}
	for i,v in pairs(t) do
		table.insert(scs, v)
	end
end)
colors:Toggle('ซื้อสีที่เลือก', false,'bsc', function(t)
	bsc = t
end)
colors:Toggle('ซื้อสีฮาคิ', false,'bac', function(t)
	bac = t
end)

local swords = tab:Section('ดาบ')
swords:MultiDropdown('เลือกดาบ', { 'ซูซุย','วาโด','ซังได' },{},'Dropdown', function(t)
	sss = {}
	for i,v in pairs(t) do
		table.insert(sss,v)
	end
end)
swords:Toggle('ซื้อดาบที่เลือก', false,'bss', function(t)
	bss = t
end)
swords:Toggle('ซื้อดาบ', false,'bas', function(t)
	bas = t
end)

local tp = win:Tab('วาป')
local travel = tp:Section('หลัก')
travel:Button('โลก 3', function()
	Remotes.CommF_:InvokeServer('TravelZou')
end)
travel:Button('โลก 2', function()
	Remotes.CommF_:InvokeServer('TravelDressrosa')
end)
travel:Button('ย้ายเซิร์ฟ', function()
	local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
	module:Teleport(game.PlaceId)
end)

spawn(function()
	while wait(0.1) do
		if bsc then
			pcall(function()
				for i,v in pairs(scs) do
					local colors = { ['ส้มแดง'] = 'Orange Soda',['เหลืองเข้ม'] = 'Bright Yellow',['เหลืองอ่อน'] = 'Yellow Sunshine',['เขียวอ่อน'] = 'Slimy Green',['เขียวเข้ม'] = 'Green Lizard',['ฟ้า'] = 'Blue Jeans',['ม่วง'] = 'Plump Purple',['ชมพู'] = 'Fiery Rose',['ส้ม'] = 'Heat Wave',['น้ำเงิน'] = 'Absolute Zero',['ขาว'] = 'Snow White',['แดง'] = 'Pure Red',['ม่วงแดง'] = 'Winter Sky' }
					local a,b = Remotes.CommF_:InvokeServer("ColorsDealer","1")
					if Player.Data.Fragments.Value >= b and string.find(Remotes.CommF_:InvokeServer("ColorsDealer","1"),colors[v]) then
						Remotes.CommF_:InvokeServer("ColorsDealer","2")
					end
				end
			end)
		end
		if bac then
			pcall(function()
				local a,b = Remotes.CommF_:InvokeServer("ColorsDealer","1")
				if Player.Data.Fragments.Value >= b then
					Remotes.CommF_:InvokeServer("ColorsDealer","2")
				end	
			end)
		end
		if bss then
			pcall(function()
				for i,v in pairs(sss) do
					local swords = { ['วาโด'] = 'Wando',['ซูซุย'] = 'Shisui',['ซังได'] = 'Saddi'}
					if string.find(Remotes.CommF_:InvokeServer("LegendarySwordDealer","1"),swords[v]) then
						Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
					end
				end
			end)
		end
		if bas then
			pcall(function()
				if Remotes.CommF_:InvokeServer("LegendarySwordDealer","1") then
					Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
				end
			end)
		end
	end
end)