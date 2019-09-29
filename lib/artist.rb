require_relative "concerns.rb"

class Artist

    attr_accessor :name, :songs 

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
        artist = Artist.new(name)
        artist.save
        artist
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