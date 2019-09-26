

class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name, :artist

  @@all = []




end
