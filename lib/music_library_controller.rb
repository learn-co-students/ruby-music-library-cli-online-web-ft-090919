class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
    MusicImporter.new(path)
  end
  
end