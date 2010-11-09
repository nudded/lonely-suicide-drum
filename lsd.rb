require 'fileutils'
require 'sinatra/base'
require 'erb'
require 'player/mplayer_player'

class LSD < Sinatra::Base

  # Allow static files from the public directory
  set :static, true
  set :public, 'public'

  # Clean music direcory
  MUSIC_DIRECTORY = File.expand_path 'test_music'
  Dir.glob("#{MUSIC_DIRECTORY}/*").each do |file|
    File.delete file
  end

  # ID for generating file names
  @@id = 0

  # Start the player
  @@player = MPlayerPlayer.new
  Thread.new {@@player.run}

  # Show song list
  get '/songs' do
    content = erb :songs, :locals => {:now_playing => @@player.now_playing,
                                      :queue => @@player.queue}
    erb :index, :locals => {:content => content}
  end

  # Add a song
  post '/songs' do
    # Read POST'ed file and put it into the MUSIC_DIRECTORY
    data = params[:data]
    tempfile = data[:tempfile]
    file_name = File.join MUSIC_DIRECTORY, @@id.to_s + "-" + data[:filename]
    File.open file_name, "wb" do |file|
      file.write(tempfile.read)
    end

    # Add filename to the queue and increment id
    @@id = @@id + 1
    if @@player.add_song file_name
      "HUGE SUCCES\n"
    else
      status 403
      "Queue is full\n"
    end
  end

  # Home
  get '/' do 
    redirect '/songs'
  end

end
