require_relative '../lib/concerns/findable'
class Genre

    extend Concerns::Findable


    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        # @@all << self
        @songs = []
        save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all << self
    end

    def self.create(genre)
        self.new(genre)
    end

    def artists
        songs.collect{ |s| s.artist }.uniq
    end


end