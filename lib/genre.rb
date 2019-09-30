class Genre 
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    #save
  end 
  
  def self.all 
    @@all 
  end
  
  def save 
    self.class.all << self 
  end
  
  def self.destroy_all 
    @@all.clear 
  end
  
  def self.create(name) 
    genre = Genre.new(name) 
    genre.save
    genre
  end
  
  def artists
    songs.collect {|sg| sg.artist}.uniq
  end
end