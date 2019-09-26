require 'bundler'
Bundler.require

module Concerns
  module Findable
  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def find_by_name(name)
    all.detect {|song| song.name == name}
  end
  end
end

require_all 'lib'