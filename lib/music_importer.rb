
require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    dir_files = Dir.glob(@path + "/*.mp3")
    files = []
    dir_files.each { |file| files << file.split("/").last}
    files
  end

  def import
    files.each { |file| Song.create_from_filename(file)}
  end


end