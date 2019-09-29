require "./lib/concerns/findable.rb"
class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def songs 
    @songs 
  end 
  
  def save
    @@all << self 
  end 
  
  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.artist = self if song.artist.nil?
  end
  
  def genres 
    self.songs.collect {|song|song.genre}.uniq
  end
end 