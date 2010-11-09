# Mplayer implementation
require 'player'

class MPlayerPlayer < Player
  def play_song song
    `mplayer -quiet '#{song}'`
  end
end
