class Genre
  extend Concerns::Findable

  attr_accessor :name, :song

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    @artist = artist
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

  def self.create(new_genre)
    genre = Genre.new(new_genre)
    @@all << genre
    genre
  end

  def artists
    artist = @songs.collect{|song| song.artist}
    artist.uniq
  end

  def songs
    @songs
  end

end
