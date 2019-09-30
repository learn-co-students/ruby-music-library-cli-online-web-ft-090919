class Song
attr_accessor :name, :artist
# attr_reader :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @@all << self
    self.artist=(artist) unless artist == nil

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
  def self.create(song, artist=nil)
    song = Song.new(song, artist)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
  artist.add_song(self)
  end


end
