# Mplayer implementation
require 'player'

class MPlayerPlayer < Player
  def initialize mplayer_path
    super()
    @mplayer_path = mplayer_path
  end

  def play_song song
    puts "Playing #{song.file_name}..."
    `#{@mplayer_path} -quiet '#{song.file_name}'`
  end
end
