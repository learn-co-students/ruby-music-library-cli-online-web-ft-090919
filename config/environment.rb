require 'bundler'
require 'pry'

Bundler.require

module Concerns
  module Findable
    def find_by_name(song_name)
      self.all.find{|song| song.name == song_name}
    end

    def find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create(song_name)
    end

    def create(new)
      song = self.new(new)
      song.save
      song
    end
  end
end

require_all 'lib'
