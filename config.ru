$:.unshift Dir.pwd
require 'lsd'
require 'player/mplayer_player'

player = MPlayerPlayer.new "mplayer"
run LSD.new(player, 'test_music')
