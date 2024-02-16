fx_version 'cerulean'
game 'gta5'

author 'Heryod'
description 'Police notification script'
version '1.0.0'

server_script 'server.lua'

client_script 'client.lua'

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css'
}

export 'SendToNUI'

ui_page 'ui/index.html'