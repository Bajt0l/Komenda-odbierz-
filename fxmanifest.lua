fx_version 'cerulean'
game 'gta5'

name '/odbierz'
description 'Przekazuje przedmioty startowe dla graczy za pomoca komendy.'
author 'Bajt0l#1008'
version '1.0.0'

server_scripts {
  '@oxmysql/lib.lua', -- Zależność do biblioteki oxmysql.
  'server.lua'
}
