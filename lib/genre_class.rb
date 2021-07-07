require 'pry'
require_relative '../lib/concerns/findable_module.rb'
class Genre

  @@all = []

  extend Concerns::Findable

  def self.create(name)
    obj = Genre.new(name)
    obj
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists
    #binding.pry
    Song.all.collect {|song| song.artist if song.genre == self}.uniq
  end


end
