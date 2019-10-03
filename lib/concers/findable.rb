module Concerns
    module Findable
        def find_by_name(name_str)
            self.all.find { |item| item.name == name_str }
        end
        
        def find_or_create_by_name(name_str)
            if self.find_by_name(name_str)
                self.find_by_name(name_str)
            else
                self.create(name_str)
            end
        end
    end
end