-- Key System with GUI
local correct_key = "Batman"

-- Create the form (main window)
local form = createForm()
form.Caption = "Enter Key"
form.Width = 400
form.Height = 200

-- Create a label for the instructions
local label = createLabel(form)
label.Caption = "Enter the key to proceed:"
label.Left = 20
label.Top = 20

-- Create the text input box for key entry
local entry = createEdit(form)
entry.Left = 20
entry.Top = 50
entry.Width = 360

-- Create the button
local button = createButton(form)
button.Caption = "Submit"
button.Left = 290
button.Top = 115
button.Width = 110
button.Height = 40

-- Function to trim whitespace
function trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- Action for button click
function button.OnClick()
    local user_key = trim(entry.Text)
    if user_key:lower() == correct_key:lower() then
        label.Caption = "Key accepted. Running script..."
        print("Executing the main Lua script...")

        -- Fetch and execute external script
        local url = "https://raw.githubusercontent.com/Tjhost/rbs/refs/heads/main/37.lua"
        local internet = getInternet()
        local response = internet.getURL(url)
        internet.destroy()
        if response then
            local func, err = loadstring(response)
            if func then
                func()
            else
                print("Error loading script:", err)
            end
        else
            print("Failed to fetch script.")
        end
    else
        label.Caption = "Incorrect key. Try again."
    end
end

-- Check if the form is visible, and show it if not
if not form.Visible then
    form.Visible = true
    form.ShowModal()
else
    print("Form is already visible!")
end
