class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def save 
    @@all << self

  end
  
  def artist=(artist)
    # puts "\n\n\nin a ="
    # puts artist.name
    # puts @name
    @artist = artist
    artist.add_song(self)
  end

   def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self) 
      genre.songs << self
    end
  end

  def self.find_by_name(name)
   all.detect{ |s| s.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    file = file.gsub('.mp3', '')
    artist, song, genre  = file.split(' - ')
    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre)
    Song.new(song, song_artist, song_genre)
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  
  end

  def self.create(name)
   Song.new(name)
  end
end