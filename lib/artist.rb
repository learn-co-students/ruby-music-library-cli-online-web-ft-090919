class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def add_song(song)
    if song.artist != self &&! @songs.include?(song)
      song.artist = self
      @songs << song
    end
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
  
  def self.create(name)
    Artist.new(name)
  end
end