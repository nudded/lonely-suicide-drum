# Music player
require 'song'

class Player
  def initialize
    @queue = Array.new
    @now_playing = nil
  end

  def add_song file_name
    if @queue.size < 20
      @queue << Song.new(file_name)
      true
    else
      false
    end
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
        File.delete song.file_name
      end
    end
  end

  def now_playing
    @now_playing
  end

  def queue
    @queue
  end

  # Default implementation: override this!
  #
  # This function should block while the file is playing.
  #
  def play_song song
    puts "Playing #{song.file_name}..."
    sleep 10
  end
end
