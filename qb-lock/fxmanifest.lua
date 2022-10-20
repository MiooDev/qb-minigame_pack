fx_version 'bodacious'
games { 'gta5' }

author 'Mio'
description 'Lockpick Circle Mini-Game Nopixel Style'
version '1.0'

client_scripts {
    'client/*.lua',
}

ui_page {
    'html/index.html',
}
files {
    'html/index.html',
    'html/*.css',
    'html/*.js',
}

exports {
    "StartLockPickCircle"
}