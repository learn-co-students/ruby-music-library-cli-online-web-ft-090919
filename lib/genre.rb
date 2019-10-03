class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.create(name_str)
        self.new(name_str)
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

    def add_song(song)
        if song.genre.nil?
            song.genre = self
        end
        if !self.songs.include?(song)
            self.songs << song
        end
    end

    def artists
        self.songs.map { |song| song.artist }.uniq
    end

end