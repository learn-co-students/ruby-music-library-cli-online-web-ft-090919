require_relative 'concerns/findable.rb'

class Artist

attr_accessor :name

@@all = []

extend Concerns::Findable

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

def add_song(song)
  song.artist = self unless song.artist == self
  @songs << song unless @songs.include?(song)
end

def genres
  genre_list = self.songs.collect { |song| song.genre }
  genre_list.uniq
end


end
