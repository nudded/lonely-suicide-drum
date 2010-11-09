# Music player
class Player
  def initialize
    @queue = Array.new
    @now_playing = nil
  end

  def add_song song
    @queue << song
  end

  def run
    while true
      if @queue.empty?
        sleep 3
      else
        # Take a song from the queue, play and remove
        song = @queue.shift
        @now_playing = song
        play_song song
        @now_playing = nil
        File.delete song
      end
    end
  end

  def now_playing
    @now_playing
  end

  # Default implementation: override this!
  #
  # This function should block while the file is playing.
  #
  def play_song song
    puts "Playing #{song}..."
    sleep 4
  end
end
