require 'pry'
class MusicImporter

attr_accessor :path

def initialize(path)
  @path = path
end

def files
  list = Dir.entries(@path).select! do |music| music.end_with?("mp3")
  end
end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end




end
