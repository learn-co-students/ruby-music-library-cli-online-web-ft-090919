

class MusicImporter

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    files_array = Dir.glob(path+"/*.mp3")
    files_array.map do |filepath|
      File.basename(filepath)
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end

  end
end
