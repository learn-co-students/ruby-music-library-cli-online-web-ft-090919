class Genre 
  attr_accessor :name
  attr_reader :songs 
  
  @@all = [] 
  
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
  
  def artist 
    songs.collect {|song| song.artist}.uniq
  end 
  
  
end 

  