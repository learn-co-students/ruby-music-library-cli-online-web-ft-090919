require "pry"
class Song
  attr_reader :artist, :genre
  attr_accessor :name
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end
  
  def name=(name)
    @name = name
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  # def self.find_by_name(name)
  #   all.detect do |song|
  #     song.name == name
  #   end
  # end
  
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end
  
  def self.new_from_filename(file_name)
    file = file_name.split(/( - |.mp3)/)
    song = Song.find_or_create_by_name(file[2])
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[4])
    song.genre = genre
    song.artist = artist
    song
    #binding.pry
  end
  
  def self.create_from_filename(file_name)
    file = self.new_from_filename(file_name)
    file.save
    file
  end
end