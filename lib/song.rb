class Song
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
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

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist()
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def self.new_from_filename(name)
  song_name = name.split(" - ")[1]
  artist_name = name.split(" - ")[0]
  genre_name = name.split(" - ")[2].chomp(".mp3")
  song = self.find_or_create_by_name(song_name)
  song.artist = Artist.find_or_create_by_name(artist_name)
  song.genre = Genre.find_or_create_by_name(genre_name)
  song
end

def self.create_from_filename(name)
  @@all << self.new_from_filename(name)
end

end
