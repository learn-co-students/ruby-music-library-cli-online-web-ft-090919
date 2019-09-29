class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
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
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    Song.all.each do |song|
      if song.artist == self
        @songs << song
      end
    end
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !(@songs.include?(song))
      @songs << song
    end
  end
  
  def genres
    @songs.map do |song|
      song.genre
    end.uniq
  end
  
end