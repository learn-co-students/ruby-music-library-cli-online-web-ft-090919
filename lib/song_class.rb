require_relative '../lib/concerns/findable_module.rb'
class Song

  @@all = []

  extend Concerns::Findable

  def self.create(name)
    obj = Song.new(name)
    obj
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    data_array = filename.split(" - ")
    #binding.pry
    name = data_array[1]
    artist = Artist.find_or_create_by_name(data_array[0])
    genre = Genre.find_or_create_by_name(data_array[2][0..-5])
    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)

  end

  attr_accessor :name
  

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre !=nil
    self.save
  end

  def save
    @@all << self
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
    
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre= (genre)
    genre.songs << self if !genre.songs.include?(self)
    @genre = genre
  end

end
