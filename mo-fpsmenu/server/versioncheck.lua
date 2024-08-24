
-- Script Version Checker
local localVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
local fxManifestUrl = "https://raw.githubusercontent.com/matteo-scripts/mo-fpsmenu/main/mo-fpsmenu/fxmanifest.lua"

local function extractVersion(fxManifestContent)
    for line in string.gmatch(fxManifestContent, "[^\r\n]+") do
        if line:find("^version%s+'(.-)'$") then
            return line:match("^version%s+'(.-)'$")
        end
    end
    return nil
end

local function checkForUpdates()
    PerformHttpRequest(fxManifestUrl, function(statusCode, response, headers)
        print([[^4
╔───────────────────────────────────────────────────────────────────────╗
  ____  ______   __          ____   ___  ______   ______    _    __  __ 
 / ___||  _ \ \ / /         | __ ) / _ \|  _ \ \ / / ___|  / \  |  \/  |
 \___ \| |_) \ V /   _____  |  _ \| | | | | | \ V / |     / _ \ | |\/| |
  ___) |  __/ | |   |_____| | |_) | |_| | |_| || || |___ / ___ \| |  | |
 |____/|_|    |_|           |____/ \___/|____/ |_| \____/_/   \_\_|  |_|

╚───────────────────────────────────────────────────────────────────────╝
                        ]])
        if statusCode == 200 then
            local remoteVersion = extractVersion(response)
            if remoteVersion and remoteVersion ~= localVersion then
                print("^2NEW UPDATE: ^2" .. remoteVersion .. "^3 | ^1CURRENT: " .. localVersion.." ^9>> Download new version from github")
            else
                print("^2You are on latest version: ^2" .. localVersion)
            end
        else
            print("^1Failed to check for updates. Status code: " .. statusCode)
        end        
    end, "GET", "", {["Content-Type"] = "text/plain"})
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        checkForUpdates()
    end
end)
