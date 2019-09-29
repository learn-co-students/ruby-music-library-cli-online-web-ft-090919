class Artist
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_reader :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end

  def self.all
    @@all
  end
end
