

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    Song.new(name)
  end

  def artist=(artist)
    artist.add_song(self) if !artist.songs.include?(self)
    @artist = artist if !@artist
  end

  def genre=(genre)
    genre.songs << self if !genre.songs.include?(self)
    @genre = genre if !@genre
  end


end
