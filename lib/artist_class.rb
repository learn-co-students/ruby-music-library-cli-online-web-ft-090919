require 'pry'
require_relative '../lib/concerns/findable_module.rb'
class Artist

  @@all = []

  extend Concerns::Findable

  def self.create(name)
    obj = Artist.new(name)
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

  def add_song(song)
    if song.artist == self
      @songs << song if !@songs.include?(song)
    else
       song.artist = self
    end
  end

  def genres
    @songs.collect { |song| song.genre}.uniq
    
  end

  



end