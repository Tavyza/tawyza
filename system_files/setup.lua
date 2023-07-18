print("Installing system files... (This may take a bit of time)")

-- Function to download a file from GitHub
local function downloadFile(url, destination)
  local result, response = pcall(internet.request, url)
  if result then
    local file = io.open(destination, "w")
    for chunk in response do
      file:write(chunk)
    end
    file:close()
    return true
  else
    return false, response
  end
end

local filesToDownload = {
  { url = "https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/main_system.lua", dest = "/home/main_system.lua" },
  { url = "https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/command_prompt.lua", dest = "/home/command_prompt.lua" },
  { url = "https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/file_manager.lua", dest = "/home/file_manager.lua" },
  { url = "https://raw.githubusercontent.com/Tshema/TawyzaOS/main/system_files/systemsettings.lua", dest = "/home/systemsettings.lua" }
}

local success = true
for _, file in ipairs(filesToDownload) do
  local result, err = downloadFile(file.url, file.dest)
  if not result then
    success = false
    print("Failed to download " .. file.url .. ": " .. err)
  end
end

if success then
  print("System files installed.")
else
  print("OS installation failed.")
end

-- Create or overwrite the autorun.lua file with the autostart command
local file = io.open("/home/autorun.lua", "w")
file:write('os.execute("/home/main_system.lua")')
file:close()
