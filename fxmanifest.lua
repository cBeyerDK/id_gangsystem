fx_version 'cerulean'
game 'gta5'

author 'cBeyer'
description 'Advanced Gang System for ESX'
version '1.4.0'

lua54 'yes'

dependencies {
    -- Server Settings
    '/server:5181',
    '/gameBuild:mptuner',
    '/onesync',

    -- Resources
    'id_core',
    'id_notify',
    'id_helpnotify',
    'oxmysql',
    'es_extended'
}

shared_scripts {
    'config.lua',
    'shared/import.lua',
    '@id_core/shared/language.lua',
    'shared/langs/*.lua',
    'shared/utils.lua',
}

server_scripts {
    'server/utils.lua',
    'server/main.lua',
    'server/events.lua',
}

client_scripts {
    'client/utils.lua',
    'client/main.lua',
    'client/events.lua',
}

escrow_ignore {
    'shared/langs/*.lua',
    'config.lua',
    'shared/utils.lua',
    'client/utils.lua',
    'server/utils.lua',
}