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
        ExecuteCommand( "prednacistvozidla" )
      end
    },
    
    {
      title = Config.Menu.maps,
      description = Config.Desc.desc10,
      icon = 'house',
      onSelect = function()
        ExecuteCommand( "prednacistmapy" )
      end
    },
    {
      title = Config.Menu.EUP,
      description =  Config.Desc.desc11,
      icon = 'shirt',
      onSelect = function()
        ExecuteCommand( "prednacistobleceni" )
      end
    },
  }
})

RegisterCommand(Config.Command, function()
  lib.showContext('ooopen_menu')
end)