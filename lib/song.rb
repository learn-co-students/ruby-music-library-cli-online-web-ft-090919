class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if !artist.nil?
            self.artist = artist
        end
        if !genre.nil?
            self.genre = genre
        end
        save
    end

    def self.create(name_str)
        self.new(name_str)
    end

    def self.new_from_filename(filename)
        attributes = filename.split(" - ")
        artist_name_str = attributes[0]
        song_name_str = attributes[1]
        genre_name_str = attributes[2].split(".").first
        song = self.find_or_create_by_name(song_name_str)
        song.artist = Artist.find_or_create_by_name(artist_name_str)
        song.genre = Genre.find_or_create_by_name(genre_name_str)
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

end