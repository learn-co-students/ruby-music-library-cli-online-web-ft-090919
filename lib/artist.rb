class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = [] 
  
 
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def add_song(song)
    song.artist = self if song.artist != self
    @songs << song if !@songs.include?(song)
  end
  
  def genres 
    Song.all.collect{ |song| song.genre }.uniq
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