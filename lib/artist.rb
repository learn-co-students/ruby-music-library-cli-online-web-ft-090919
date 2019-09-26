class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def add_song(song)
       if song.artist != self
        song.artist = self
        @songs << song
       end
    end
    
    def genres
        songs.collect do |song|
            song.genre
        end
    end

    def songs
        @songs
    end

    def self.create(name)
        artist =  Artist.new(name)
        artist.save
        artist
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end
end

