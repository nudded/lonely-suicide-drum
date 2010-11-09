# Representation of a song
require 'taglib2'

class Song
  def initialize file_name
    @file_name = file_name
    @file = TagLib2::File.new file_name
  end

  def file_name
    @file_name
  end

  def title
    @file.title
  end

  def artist
    @file.artist
  end

  def album
    @file.album
  end
end
