fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'itzzkratos | Sirius Studios'
description 'Simple Kill Tracker For FiveM Servers'
version '1.0.0'

client_script 'client.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'oxmysql'
}
