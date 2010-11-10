# Representation of a song
require 'taglib2'

class Song
  attr_accessor :file_name

  def initialize file_name
    @file_name = file_name
    @file = TagLib2::File.new file_name
  end

  def method_missing name
    if @file.respond_to? name
      @file.send name
    else
      super
    end
  end
end
