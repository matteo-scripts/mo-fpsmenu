fx_version 'cerulean'
game 'gta5'
name "mo-fpsmenu"
description "optimalization menu"
author 'Matteo'
version '2.0'
lua54 'yes'


client_scripts {
    'client/matafps.lua',
}

shared_scripts { 
	'@ox_lib/init.lua',
    'config.lua'
}

escrow_ignore {
    'config.lua',
}

--dependecies "https://github.com/overextended/ox_lib"




