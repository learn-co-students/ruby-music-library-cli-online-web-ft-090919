require "pry"
class Artist
  attr_accessor :name
  attr_reader :songs, :genres
  extend Concerns::Findable
  
  @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
    end
    
    def self.all
      @@all
    end
    
    def self.destroy_all
      all.clear
    end
    
    def save
      @@all << self
    end
    
    def self.create(name)
      name = self.new(name)
      name.save
      name
    end
    
    def songs
      Song.all.each do |song|
        @songs << song
      end
    end
    
    def add_song(song)
      #binding.pry
      if song.artist == nil
        song.artist = self
      end
      
      unless self.songs.include?(song)
        self.songs << song
      end
    end
    
    def genres
      genres = []
      songs.each do |song|
        genres << song.genre
      end
      genres.uniq
    end
end