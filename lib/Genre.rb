require_relative 'concerns.rb'

class Genre

extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
      @@all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def songs
    @songs
  end

  def artists
      songs.collect {|song| song.artist}.uniq
  end



end