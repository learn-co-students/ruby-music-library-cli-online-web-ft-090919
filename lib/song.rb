require 'pry'

class Song 
  
 # extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
    @artist = artist
    @genre = genre 
  end 
  
  def genre=(genre)
    if @genre == nil 
      @genre = genre 
    else 
      @genre = genre 
    end 
    if self.genre != nil && !(@genre.songs.include?(self)) 
    @genre.songs << self
    end 
  end 
  
  def artist=(artist)
    if @artist == nil 
      @artist = artist 
    else 
      @artist = artist 
    end 
    if self.artist != nil 
      @artist.add_song(self)
    end 
    @artist 
  end 
  
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song
  end 
  
  # def self.create(name)
  #   self.new(name).tap do |song|
  #     song.save
  #   end
  # end
  
  def self.find_by_name(name)
    self.all.find do |song| song.name == name end 
  end 
  
  def self.find_or_create_by_name(name)
  if self.find_by_name(name)
      self.find_by_name(name)
  else 
    self.create(name)
  end
  end 
  
  def self.new_from_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    genre_name = file.split(" - ")[2].chomp(".mp3")
    
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song 
  end 
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save 
  end 
  
end 
