module Concerns::Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      ob = self.new(name)
      ob.save
      ob
    end
  end

  module InstanceMethods
    attr_accessor :name

    def initialize(name)
      self.name = name
    end

    def save
      self.class.all << self
    end
  end
end
