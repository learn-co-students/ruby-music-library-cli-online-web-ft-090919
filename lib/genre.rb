require 'pry'
class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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
    genre = Genre.new(name)
    genre
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end
end
