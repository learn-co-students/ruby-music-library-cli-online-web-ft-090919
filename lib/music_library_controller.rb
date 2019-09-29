class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    file =  MusicImporter.new(path)
    file.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.chomp
    case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      when "exit"
        'exit'
      else
        call
      end
  end
  
  def library(klass = Song)
    lib = klass.all.collect {|item| item if item.class == klass }
    lib = lib.delete_if {|item| item == nil}
    lib.uniq
  end

  def list_songs
    lib = self.library.sort_by {|song| song.name}
    lib.each do |song|
      puts "#{lib.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    lib = self.library(Artist).sort_by {|item| item.name}
    artists = lib.collect {|item| "#{item.name}"}.uniq
    artists.each {|artist| puts "#{artists.index(artist) + 1}. #{artist}"}
  end
  
  def list_genres
    lib = self.library(Genre).sort_by {|item| item.name}
    genres = lib.collect {|item| "#{item.name}"}.uniq
    genres.each {|genre| puts "#{genres.index(genre) + 1}. #{genre}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    songs =[]
    self.library.each do |song|
      if song.artist.name == input
        songs << song
      end
    end
    songs = songs.sort_by {|song| song.name}
    songs.each do |song|
      if songs != nil
        puts "#{songs.index(song) + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    songs =[]
    self.library.each do |song|
      if song.genre.name == input
        songs << song
      end
    end
    songs = songs.sort_by {|song| song.name}
    songs.each do |song|
      if songs != nil
        puts "#{songs.index(song) + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def song_array
    lib = self.library.sort_by {|song| song.name}
    lib.collect do |song|
      "#{lib.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def parser(filename)
    file_parts = filename.gsub(/(\.mp3)/,'')
    file_parts = file_parts.split(" - ")
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songs = self.song_array
    input = gets.chomp.to_i
    if input > 0 && input <= self.library.size
      selected_song = songs[input - 1]
      selected_song = parser(selected_song)[1]
      song = Song.find_by_name(selected_song)
      puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
    end
  end
  
end