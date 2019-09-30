class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.glob(path + "/*mp3")
    files.collect do |file|
      file.gsub(/(.*\/)/, "")
    end
  end
  
  def import
    import_files = files
    import_files.each do |import_file|
      Song.create_from_filename(import_file)
    end
  end
end