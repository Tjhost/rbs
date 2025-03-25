-- Key System with GUI
local correct_key = "Batman"
local ui = require("lgi").Gtk

local app = ui.Application.new("com.example.keyapp", 0)

function on_activate()
    local window = ui.ApplicationWindow.new(app)
    window:set_title("Enter Key")
    window:set_default_size(300, 100)
    
    local box = ui.Box.new(ui.Orientation.VERTICAL, 5)
    local entry = ui.Entry.new()
    local button = ui.Button.new_with_label("Submit")
    local label = ui.Label.new("Enter the key to proceed:")
    
    function button:on_clicked()
        if entry:get_text() == correct_key then
            label:set_text("Key accepted. Running script...")
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
            label:set_text("Incorrect key. Try again.")
        end
    end
    
    box:pack_start(label, false, false, 5)
    box:pack_start(entry, false, false, 5)
    box:pack_start(button, false, false, 5)
    
    window:add(box)
    window:show_all()
end

app.on_activate = on_activate
app:run()
