require "pry"
class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def artists
    # binding.pry
    artists = []
    Song.all.each do |song|
      if song.genre == self
        artists << song.artist
      end
    end
    artists.uniq
  end
  
end