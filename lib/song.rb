 class Song
   attr_accessor :name, :artist
   @@all = []
   def initialize(name, artist= nil)
       @name = name
       self.artist = artist

   end
   def self.all
       @@all
   end
   def self.destroy_all
       @@all.clear
   end
   def save
       @@all << self
   end
   def self.create(name)
     song = Song.new(name)
     song.save
     song
   end

 def self.artist
   artist.add_song(self)
   .all.push(self)
 end

end
