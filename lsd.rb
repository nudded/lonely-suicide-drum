require 'sinatra/base'

class LSD < Sinatra::Base

  MUSIC_DIRECTORY = File.expand_path '~/test_music/'

  get '/songs' do
    Dir[MUSIC_DIRECTORY + '/*'].join ' '
  end

  get '/' do 
    "awesome" 
  end

end
