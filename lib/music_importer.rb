class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.glob("#{path}**/*")
		files = files.collect{|file| file.scan(/(?<=mp3s\/)(.*)/)}.flatten
  end
  
  def import
    all_files = self.files
		all_files.each do |file|
			song = Song.create_from_filename(file)
		end
  end
  
end