# Music player
class Player
  def initialize queue
    @queue = queue
  end

  def run
    while true
      # Try to play a song
      unless @queue.empty?
        song = @queue.shift
        puts "Playing #{song}..."
      end

      # Sleep a little
      sleep 3
    end
  end
end
