class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre
    end

    def self.create(name)
        song =  Song.new(name)
        song.save
        song
    end

    def genre=(genre)
        if genre != nil && self.genre != genre
            @genre = genre
            genre.songs << self
        end
    end

    def artist=(artist)
        if artist != nil
        @artist = artist
        @artist.add_song(self)
        end
    end

    def self.find_by_name(name)
        @@all.find do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
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
