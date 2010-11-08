require 'sinatra/base'

class LSD < Sinatra::Base

  MUSIC_DIRECTORY = File.expand_path '~/test_music/'

  get '/songs' do
    @songs = Dir[MUSIC_DIRECTORY + '/*']
  end

  get '/' do 
    "awesome" 
  end

end
