
class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.new_from_filename(filename)
    file_info = filename.split(" - ")
    @name = file_info[1]
    new_song = find_or_create_by_name(@name)
    new_song.artist = Artist.find_or_create_by_name(file_info[0])
    new_song.genre = Genre.find_or_create_by_name(file_info[2][0..-5])
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
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
