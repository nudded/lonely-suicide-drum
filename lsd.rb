require 'fileutils'
require 'sinatra/base'
require 'erb'

class LSD < Sinatra::Base

  # Allow static files from the public directory
  set :static, true
  set :public, 'public'

  def initialize player, music_directory
    super()

    @music_directory = File.expand_path music_directory
    @player = player

    # Clean music direcory
    Dir.glob("#{@music_directory}/*").each do |file|
      File.delete file
    end

    # ID for generating file names
    @id = 0

    # Start the player
    Thread.new {@player.run}
  end

  # Show song list
  get '/songs' do
    content = erb :songs, :locals => {:now_playing => @player.now_playing,
                                      :queue => @player.queue}
    erb :index, :locals => {:content => content}
  end

  # Add a song
  post '/songs' do
    # Read POST'ed file and put it into the music directory
    data = params[:data]
    tempfile = data[:tempfile]
    extension = File.extname(data[:filename])
    file_name = File.join @music_directory, @id.to_s + extension
    File.open file_name, "wb" do |file|
      file.write(tempfile.read)
    end

    # Add filename to the queue and increment id
    @id = @id + 1
    if @player.add_song file_name
      redirect '/songs'
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
