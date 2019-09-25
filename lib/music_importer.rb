class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + '/*'].map { |filename| filename.split("/").last }
  end

  def import
    files.map { |filename| Song.create_from_filename(filename) }
  end
end
