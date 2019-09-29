require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end
  
  def self.all
    @@all
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
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.add_song(self)
    end
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    file_parts = filename.gsub(/(\.mp3)/,'')
    file_parts = file_parts.split(" - ")
    artist = Artist.find_or_create_by_name(file_parts[0])
    genre = Genre.find_or_create_by_name(file_parts[2])
    song = Song.find_or_create_by_name(file_parts[1])
    song.genre = genre
    song.artist = artist
    song
  end
  
  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
    
end