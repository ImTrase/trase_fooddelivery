fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Trase'
description 'A food devlivery script, similar to something like Doordash.'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

files {
    'modules/**/client.lua',
    'modules/**/server.lua',
    'locales/*.json'
}