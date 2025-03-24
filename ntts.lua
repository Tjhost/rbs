-- Define the form template and buttons
local template = createForm(true)
template.Width = 450
template.Height = 260
template.Caption = "Repeating's CE Menu"
template.Color = 0x4a4a4a

-- Button for Orien Skip
local button1 = createButton(template)
button1.Left = 26
button1.Top = 15
button1.Width = 110
button1.Height = 40
button1.OnClick = function()
    sharetoRail()
    button1.Color = 0x00FF00  -- Turn button green when clicked
end
button1.Caption = "Orien Skip"

-- Button for MakerPenUI
local button2 = createButton(template)
button2.Left = 160
button2.Top = 15
button2.Width = 110
button2.Height = 40
button2.OnClick = function()
    makerUI()
    button2.Color = 0x00FF00
end
button2.Caption = "MakerPenUI"

-- Button for Cam To Rail
local button3 = createButton(template)
button3.Left = 26
button3.Top = 65
button3.Width = 110
button3.Height = 40
button3.OnClick = function()
    sharetoRail()
    button3.Color = 0x00FF00
end
button3.Caption = "Cam To Rail"

-- Button for Feed To Shotgun
local button4 = createButton(template)
button4.Left = 160
button4.Top = 65
button4.Width = 110
button4.Height = 40
button4.OnClick = function()
    feedtoshot()
    button4.Color = 0x00FF00
end
button4.Caption = "Feed To Shotgun"

-- Button for Quest Shit
local button5 = createButton(template)
button5.Left = 290
button5.Top = 15
button5.Width = 110
button5.Height = 40
button5.OnClick = function()
    questShit()
    button5.Color = 0x00FF00
end
button5.Caption = "Quest Shit"

-- Button for Cam To PaintSniper
local button6 = createButton(template)
button6.Left = 290
button6.Top = 65
button6.Width = 110
button6.Height = 40
button6.OnClick = function()
    sharetoPaintsniper()
    button6.Color = 0x00FF00
end
button6.Caption = "Cam To PaintSniper"

-- Button for Cam To Minigun
local button7 = createButton(template)
button7.Left = 160
button7.Top = 115
button7.Width = 110
button7.Height = 40
button7.OnClick = function()
    sharetoLc()
    button7.Color = 0x00FF00
end
button7.Caption = "Cam To Minigun"

-- Button for Feed To Rocket
local button8 = createButton(template)
button8.Left = 290
button8.Top = 115
button8.Width = 110
button8.Height = 40
button8.OnClick = function()
    feedtoRl()
    button8.Color = 0x00FF00
end
button8.Caption = "Feed To Rocket"

-- Button for Rapid Fire
local button9 = createButton(template)
button9.Left = 26
button9.Top = 115
button9.Width = 110
button9.Height = 40
button9.OnClick = function()
    rapidFire()
    button9.Color = 0x00FF00
end
button9.Caption = "Rapid Fire"

-- Button for Gravity UP
local button10 = createButton(template)
button10.Left = 26
button10.Top = 165
button10.Width = 110
button10.Height = 40
button10.OnClick = function()
    grvUp()
    button10.Color = 0x00FF00
end
button10.Caption = "Gravity (UP)"

-- Button for Gravity DOWN
local button11 = createButton(template)
button11.Left = 160
button11.Top = 165
button11.Width = 110
button11.Height = 40
button11.OnClick = function()
    grvDown()
    button11.Color = 0x00FF00
end
button11.Caption = "Gravity (Down)"

-- Button for Gravity Restore
local button12 = createButton(template)
button12.Left = 290
button12.Top = 165
button12.Width = 110
button12.Height = 40
button12.OnClick = function()
    grvRestore()
    button12.Color = 0x00FF00
end
button12.Caption = "Gravity (Restore)"

-- Button for RailGun Inf Ammo
local button13 = createButton(template)
button13.Left = 26
button13.Top = 215
button13.Width = 110
button13.Height = 40
button13.OnClick = function()
    railinfAmmo()
    button13.Color = 0x00FF00
end
button13.Caption = "RailGun Inf"

-- Button for Shotgun Inf Ammo
local button14 = createButton(template)
button14.Left = 160
button14.Top = 215
button14.Width = 110
button14.Height = 40
button14.OnClick = function()
    shotinfAmmo()
    button14.Color = 0x00FF00
end
button14.Caption = "Shotgun Inf"

-- Function Definitions for AOB Replacements

function sharetoRail()
    local searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    local replaceA = '5B 41 72 65 6E 61 5F 52 61 69 6C 47 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function feedtoshot()
    local searchA = '5B 46 65 65 64 62 61 63 6B 54 6F 6F 6C 5D'
    local replaceA = '5B 41 72 65 6E 61 5F 53 68 6F 74 67 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function rapidFire()
    local searchA = '33 33 D3 3F 00 00 00 00 00 00'
    local replaceA = '00 3C 1C 46 00 00 00 00 00 00'
    AOBRep(searchA, replaceA)
end

function sharetoPaintsniper()
    local searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    local replaceA = '5B 50 61 69 6E 74 62 61 6C 6C 52 69 66 6C 65 53 63 6F 70 65 64 5D'
    AOBRep(searchA, replaceA)
end

function sharetoLc()
    local searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    local replaceA = '5B 41 72 65 6E 61 5F 50 6F 77 65 72 57 65 61 70 6F 6E 5F 42 65 61 6D 47 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function feedtoRl()
    local searchA = '5B 46 65 65 64 62 61 63 6B 54 6F 6F 6C 5D'
    local replaceA = '5B 41 72 65 6E 61 5F 52 6F 63 6B 65 74 4C 61 75 6E 63 68 65 72 5D'
    AOBRep(searchA, replaceA)
end

function grvUp()
    local searchA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    local replaceA = '00 40 1C 46 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
end

function grvDown()
    local searchA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    local replaceA = '00 40 1C C6 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
end

function grvRestore()
    local searchA = '00 40 1C C6 00 00 00 00 0A D7'
    local replaceA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    local searchB = '00 40 1C 46 00 00 00 00 0A D7'
    local replaceB = 'C3 F5 1C C1 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
end

function railinfAmmo()
    local searchA = '03 00 00 00 06 00 00 00 34 36'
    local replaceA = '7F 96 98 00 06 00 00 00 34 36'
    AOBRep(searchA, replaceA)
end

function shotinfAmmo()
    local searchA = '03 00 00 00 06 00 00 00 D8 41'
    local replaceA = '7F 96 98 00 06 00 00 00 D8 41'
    AOBRep(searchA, replaceA)
end
