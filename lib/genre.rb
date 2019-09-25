class Genre
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_reader :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end
end
