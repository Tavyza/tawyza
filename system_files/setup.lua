print("Installing system files... (This may take a bit of time)")

-- Download system files from GitHub
os.execute("wget -f https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/main_system.lua /home/main_system.lua")
os.execute("wget -f https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/command_prompt.lua /home/command_prompt.lua")
os.execute("wget -f https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/file_manager.lua /home/file_manager.lua")
os.execute("wget -f https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/systemsettings.lua /home/systemsettings.lua")

-- Create or overwrite the autorun.lua file with the autostart command
local file = io.open("/home/autorun.lua", "w")
file:write('os.execute("main_system.lua")')
file:close()

print("System files installed.")
