module Findable

    def find_by_name(name)
      all.all.detect{|i| i.name == name}
    end
  
    def find_or_create_by_name(name)
      all.find_by_name(name) || self.create(name)
    end
end