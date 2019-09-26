require 'bundler'

Bundler.require

module Concerns
  module ClassMethods

    def all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(new_ins)
      new_instance = self.new(new_ins)
      save
    end

  end

  module InstanceMethods

    def initialize(name)
      @name = name
    end

    def save
      @@all << self
    end
  end

end
require_all 'lib'
