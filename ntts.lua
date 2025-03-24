-- Create the template form
local template = createForm(true)
template.Width = 450
template.Height = 260
template.Caption = "Repeating's CE Menu"
template.Color = 0x4a4a4a

-- Function to execute when the "Orien Skip" button is clicked
function skip(button)
    local searchA = '31 00 61 00 63 00 31 00 35 00 31 00 37 00 37 00 38 00 33 00 30 00 62 00 37 00 37 00 63 00 34 00 32 00 39 00 33 00 38 00 66 00 66 00 34 00 65 00 62 00 36 00 64 00 64 00 62 00 62 00 32 00 34'
    local replaceA = '61 00 34 00 62 00 36 00 37 00 35 00 63 00 34 00 32 00 64 00 61 00 64 00 63 00 39 00 38 00 34 00 61 00 38 00 38 00 31 00 65 00 35 00 61 00 61 00 65 00 35 00 61 00 66 00 38 00 35 00 63 00 37'
    AOBRep(searchA, replaceA)
    button.Color = 0x00FF00  -- Green color when clicked
end

-- Function to execute when the "Cam To Rail" button is clicked
function sharetoRail(button)
    searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    replaceA = '5B 41 72 65 6E 61 5F 52 61 69 6C 47 75 6E 5D'
    AOBRep(searchA, replaceA)
    button.Color = 0x00FF00  -- Green color when clicked
end

-- Function to execute when the "Feed To Shotgun" button is clicked
function feedtoshot(button)
    searchA = '5B 46 65 65 64 62 61 63 6B 54 6F 6F 6C 5D'
    replaceA = '5B 41 72 65 6E 61 5F 53 68 6F 74 67 75 6E 5D'
    AOBRep(searchA, replaceA)
    button.Color = 0x00FF00  -- Green color when clicked
end

-- Function to execute when the "Rapid Fire" button is clicked
function rapidFire(button)
    searchA = '33 33 D3 3F 00 00 00 00 00 00'
    replaceA = '00 3C 1C 46 00 00 00 00 00 00'
    AOBRep(searchA, replaceA)
    button.Color = 0x00FF00  -- Green color when clicked
end

-- Create buttons and assign the above functions

-- Button: Orien Skip
local button = createButton(template)
button.Left = 26
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = function() skip(button) end
button.Caption = "Orien Skip"

-- Button: Cam To Rail
local button = createButton(template)
button.Left = 26
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = function() sharetoRail(button) end
button.Caption = "Cam To Rail"

-- Button: Feed To Shotgun
local button = createButton(template)
button.Left = 160
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = function() feedtoshot(button) end
button.Caption = "Feed To Shotgun"

-- Button: Rapid Fire
local button = createButton(template)
button.Left = 26
button.Top = 115
button.Width = 110
button.Height = 40
button.OnClick = function() rapidFire(button) end
button.Caption = "Rapid Fire"
