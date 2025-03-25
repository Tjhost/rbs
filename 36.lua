-- Key System
local correct_key = "Batman"

io.write("Enter the key to proceed: ")
local user_input = io.read()

if user_input ~= correct_key then
    print("Incorrect key. Exiting...")
    return
end

print("Key accepted. Running script...")
