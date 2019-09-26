class Genre
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.create(name)
        genre =  Genre.new(name)
        genre.save
        genre
    end

    def songs
        @songs
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