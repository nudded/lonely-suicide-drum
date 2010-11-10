$:.unshift Dir.pwd
require 'lsd'
require 'player/mplayer_player'

run LSD.new(MPlayerPlayer, 'test_music')
