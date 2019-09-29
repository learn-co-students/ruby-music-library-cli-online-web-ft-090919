require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable

attr_accessor :name

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
  object = self.new(name)
  object.save
  object
end

def songs
  @songs
end

def artists
  artists_list = self.songs.collect { |song| song.artist }
  artists_list.uniq
end

end
