

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(new_artist)
    artist = Artist.new(new_artist)
    @@all << artist
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    genres = @songs.collect{|song| song.genre}
    genres.uniq
  end

end
