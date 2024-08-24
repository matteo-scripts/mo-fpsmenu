-- ███╗░░░███╗░█████╗░████████╗░█████╗░
-- ████╗░████║██╔══██╗╚══██╔══╝██╔══██╗
-- ██╔████╔██║███████║░░░██║░░░███████║
-- ██║╚██╔╝██║██╔══██║░░░██║░░░██╔══██║
-- ██║░╚═╝░██║██║░░██║░░░██║░░░██║░░██║
-- ╚═╝░░░░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝

Config = Config or {}

lib.registerContext({
  id = 'ooopen_menu',
  title = Config.Menu.MainTitle,
  options = {
    {
      title = Config.Menu.TitleSecondary,
      description = Config.Desc.desc1, -- Upraveno
      menu = 'mata_prednacitaniemenu',
      icon = 'bars'
    },
    {
      title = Config.Menu.TitleOptimalization,
      description = Config.Desc.desc2, -- Upraveno
      menu = 'mata_optimalizacemenu',
      icon = 'bars'
    }
  }
})

lib.registerContext({
  id = 'mata_optimalizacemenu',
  title = Config.Menu.TitleOptimalizationmenu,
  options = {
    {
      title = Config.Menu.goback,
      description = Config.Desc.desc3, -- Upraveno
      icon = 'arrow-left',
      menu = 'ooopen_menu',
    },
    {
      title = Config.Menu.miniopt,
      description = Config.Desc.desc4, -- Upraveno
      icon = 'filter',
      onSelect = function()
        local ped = PlayerPedId()
        SetTimecycleModifier('exile1_plane')
        ClearAllBrokenGlass()
        ClearAllHelpMessages()
        LeaderboardsReadClearAll()
        ClearBrief()
        ClearGpsFlags()
        ClearPrints()
        ClearSmallPrints()
        ClearReplayStats()
        LeaderboardsClearCacheData()
        ClearFocus()
        ClearHdArea()
        ClearPedBloodDamage(ped)
        ClearPedWetness(ped)
        ClearPedEnvDirt(ped)
        ResetPedVisibleDamage(ped)
        ClearOverrideWeather()
        DisableScreenblurFade()
        SetRainLevel(0.0)
        SetWindSpeed(0.0)
      end
    },
    {
      title = Config.Menu.qualityandtexture,
      description = Config.Desc.desc5, -- Upraveno
      icon = 'gears',
      onSelect = function()
        local ped = PlayerPedId()
        SetTimecycleModifier('v_janitor')
        ClearAllBrokenGlass()
        ClearAllHelpMessages()
        LeaderboardsReadClearAll()
        ClearBrief()
        ClearGpsFlags()
        ClearPrints()
        ClearSmallPrints()
        ClearReplayStats()
        LeaderboardsClearCacheData()
        ClearFocus()
        ClearHdArea()
        ClearPedBloodDamage(ped)
        ClearPedWetness(ped)
        ClearPedEnvDirt(ped)
        ResetPedVisibleDamage(ped)
        ClearOverrideWeather()
        DisableScreenblurFade()
        SetRainLevel(0.0)
        SetWindSpeed(0.0)
      end
    },
    {
      title = Config.Menu.intesiveopt,
      description = Config.Desc.desc6, -- Upraveno
      icon = 'shield-halved',
      onSelect = function()
        local ped = PlayerPedId()
        SetTimecycleModifier('yell_tunnel_nodirect')
        ClearAllBrokenGlass()
        ClearAllHelpMessages()
        LeaderboardsReadClearAll()
        ClearBrief()
        ClearGpsFlags()
        ClearPrints()
        ClearSmallPrints()
        ClearReplayStats()
        LeaderboardsClearCacheData()
        ClearFocus()
        ClearHdArea()
        ClearPedBloodDamage(ped)
        ClearPedWetness(ped)
        ClearPedEnvDirt(ped)
        ResetPedVisibleDamage(ped)
        ClearOverrideWeather()
        DisableScreenblurFade()
        SetRainLevel(0.0)
        SetWindSpeed(0.0)
      end
    },
    {
      title = Config.Menu.ResetGraphic,
      description = Config.Desc.desc7, -- Upraveno
      icon = 'circle-nodes',
      onSelect = function()
        SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
      end
    }
  }
})

lib.registerContext({
  id = 'mata_prednacitaniemenu',
  title = Config.Menu.PRELOADERMENU,
  options = {
    {
      title = Config.Menu.goback,
      description = Config.Desc.desc8, -- Upraveno
      icon = 'arrow-left',
      menu = 'ooopen_menu',
    },
    {
      title = Config.Menu.cars,
      description = Config.Desc.desc9, -- Upraveno
      icon = 'car',
      onSelect = function()
        ExecuteCommand( "preloadvehicles" )
      end
    },
    
    {
      title = Config.Menu.maps,
      description = Config.Desc.desc10,
      icon = 'house',
      onSelect = function()
        ExecuteCommand( "preloadmaps" )
      end
    },
    {
      title = Config.Menu.EUP,
      description =  Config.Desc.desc11,
      icon = 'shirt',
      onSelect = function()
        ExecuteCommand( "preloadclothing" )
      end
    },
  }
})


RegisterCommand('preloadvehicles', function()
    local vehicles = GetAllVehicleModels()
    for k, v in pairs(vehicles) do
        local model = GetHashKey(v)
        if IsModelInCdimage(model) then
            RequestModel(model)
            local tick = 50
            while not HasModelLoaded(model) and tick > 0 do
                Wait(100)
                print('Downloading model: ', v)
                tick = tick - 1
            end
            SetModelAsNoLongerNeeded(model)
        end
    end

    for i=1, 100 do
        print('Now disconnect from the server and reconnect. All vehicles are preloaded.')
    end
end)

RegisterCommand('preloadclothing', function()
    local ped = PlayerPedId()
    for i=1, 13 do
        local componentId = (i - 1)
        local drawableVariations = GetNumberOfPedDrawableVariations(ped, componentId)

        for drawableId=1, drawableVariations do
            local textureIds = GetNumberOfPedTextureVariations(ped, componentId, drawableId)
            for textureId=1, textureIds do
                for paletteId=1, 4 do
                    Wait(1)
                    local paletteId = (paletteId - 1)
                    SetPedComponentVariation(
                        ped, 
                        componentId, 
                        drawableId, 
                        textureId, 
                        paletteId
                    )
                end
            end
        end
    end
    Wait(1000)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        exports['fivem-appearance']:setPlayerAppearance(skin)
    end)

    for i=1, 100 do
        print('Now disconnect from the server and reconnect. All clothing items are preloaded.')
    end
end)

RegisterCommand('preloadmaps', function()
    for i=1, 1000000 do
        if IsValidInterior(i) then
            print(i)
            PinInteriorInMemory(i)
            Wait(100)
            UnpinInterior(i)
        end
    end

    for i=1, 100 do
        print('Now disconnect from the server and reconnect. All maps are preloaded.')
    end
end)


RegisterCommand(Config.Command, function()
  lib.showContext('ooopen_menu')
end)
