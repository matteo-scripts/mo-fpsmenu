-- Script Version Checker
local localVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
local fxManifestUrl = "https://raw.githubusercontent.com/matteo-scripts/mo-fpsmenu/main/mo-fpsmenu/fxmanifest.lua"

local function extractVersion(fxManifestContent)
    for line in string.gmatch(fxManifestContent, "[^\r\n]+") do
        if line:find("^version%s+'(.-)'$") then
            return line:match("^version%s+'(.-)'$"):gsub("%s+", "") -- Trim white spaces
        end
    end
    return nil
end

local function checkForUpdates()
    PerformHttpRequest(fxManifestUrl, function(statusCode, response, headers)
        print([[^4
╔──────────────────────────────────────────╗
|               MO-SCRIPTS                |
╚──────────────────────────────────────────╝
                            ]])
        if statusCode == 200 then
            local remoteVersion = extractVersion(response)
            if not remoteVersion then
                print("^1Failed to extract version from the remote manifest.")
                return
            end
            
            print("^5Remote Version: ^3" .. remoteVersion)  -- Debug: Print remote version
            print("^5Local Version: ^3" .. localVersion)    -- Debug: Print local version
            
            if remoteVersion and remoteVersion ~= localVersion then
                print("^2NEW UPDATE: ^2" .. remoteVersion .. "^3 | ^1CURRENT: " .. localVersion .. " ^9>> Download new version from GitHub")
            else
                print("^2You are on the latest version: ^2" .. localVersion)
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
