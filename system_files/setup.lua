print("Installing system files... (This may take a bit of time)")


os.execute("wget https://github.com/Tshema/TawyzaOS/system_files/main_system.lua")
os.execute("wget https://github.com/Tshema/TawyzaOS/system_files/command_prompt.lua")
os.execute("wget https://github.com/Tshema/TawyzaOS/system_files/file_manager.lua")
os.execute("wget https://github.com/Tshema/TawyzaOS/system_files/systemsettings.lua")
os.execute("wget https://github.com/Tshema/TawyzaOS/system_files/autorun.lua")
if success then
    print("System files installed.")
else
    print("System files could not be installed."...reason)
end