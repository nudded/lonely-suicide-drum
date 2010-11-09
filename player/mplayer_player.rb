# Mplayer implementation
require 'player'

class MPlayerPlayer < Player
  def play_song song
    puts "Playing #{song.file_name}..."
    `mplayer -quiet '#{song.file_name}'`
  end
end
