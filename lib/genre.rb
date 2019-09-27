class Genre
    
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        
    end

    def self.create(name)
        genre =  Genre.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
       artist_array = @songs.collect do |song|
            song.artist
        end
        artist_array.uniq
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

