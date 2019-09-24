class Genre
  
    extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    self.name = name
    @songs = []
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name).tap {|object| object.save}
  end
  
end