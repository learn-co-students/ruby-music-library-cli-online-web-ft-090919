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
        Song.all.collect do |song|
            if song.artist == self
                song.genre
            end
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

