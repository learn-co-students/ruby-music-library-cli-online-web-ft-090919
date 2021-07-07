module Concerns::Findable

  def find_by_name(name)
    self.all.find{|song| song if song.name == name}
  end

  def find_or_create_by_name(name)
    var = self.find_by_name(name)
    if var
      var
    else
      var = self.create(name)
      var
    end
  end

end