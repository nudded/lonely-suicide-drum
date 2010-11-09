require 'fileutils'
require 'sinatra/base'
require 'player'

class LSD < Sinatra::Base

  MUSIC_DIRECTORY = File.expand_path 'test_music'

  # Clean music direcory
  Dir.glob("#{MUSIC_DIRECTORY}/*").each do |file|
    File.delete file
  end

  # ID for generating file names
  @@id = 0

  # Start the player
  @@player = Player.new
  Thread.new {@@player.run}

  # Show song list
  get '/songs' do
    @@player.now_playing
  end

  # Add a song
  post '/songs' do
    # Read POST'ed file and put it into the MUSIC_DIRECTORY
    data = params[:data]
    tempfile = data[:tempfile]
    filename = File.join MUSIC_DIRECTORY, @@id.to_s + "-" + data[:filename]
    File.open filename, "wb" do |file|
      file.write(tempfile.read)
    end

    # Add filename to the queue and increment id
    @@id = @@id + 1
    @@player.add_song filename
    'HUGE SUCCES'
  end

  # Home
  get '/' do 
    redirect '/songs'
  end

end
