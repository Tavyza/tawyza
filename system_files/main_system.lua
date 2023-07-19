local component = require("component")
local event = require("event")
local gpu = component.gpu
local term = require("term")



local options = {
    "File manager",
    "Command Prompt",
    "System settings",
    "Install app",
    "Restart computer",
    "Shut down computer",
}
local osVersion = "0.1.16" -- os version, 0.1.x is alpha, 0.2.x is beta, >1.x.x are release versions
local index = 1
local w, h = gpu.getResolution()

local function render()
    for i, option in ipairs(options) do -- iterate through options
        if i == index then
            -- insert highlight code
        else
            -- insert normal text code
        end
    end
end

while true do
    gpu.fill(1,1,w,h, "")
    gpu.setForeground(0xFFFFFF)
    print("blue")
    --gpu.setBackround(0x99B2F2)

    local ev = table.pack(event.pull())

    if ev[1] == "key_down" then
        if ev[4] == 200 then
            index = math.max(index - 1, 1)
        end
        if ev[4] == 208 then
            index = math.max(index + 1, #options)
        end

        --if ev[4] == 28 then
            -- code here for enter button
        --end
    end

    os.sleep(0.05)
end