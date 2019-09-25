
class Artist

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
    self
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
    Artist.new(name)
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if !song.artist
    # binding.pry
  end

  def genres
    artist_genres = self.songs.map {|song| song.genre }
    artist_genres.uniq
  end

end
