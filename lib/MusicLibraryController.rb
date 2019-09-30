require "pry"
class MusicLibraryController
  attr_accessor

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end
  
  def call
    input = nil
    while input != "exit"
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
        exit
      else
        call
      end
    end

  end
  
  
  
  def list_songs
    sorted_songs = Song.all.sort! do |a, b|
      a.name <=> b.name
    end
    
    sorted_songs.uniq!
    
    sorted_songs.each do |song|
      puts "#{sorted_songs.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted_songs
  end
  
  def list_artists
    sorted_songs = Artist.all.sort! do |a, b|
      a.name <=> b.name
    end
    
    sorted_songs.uniq!
    
    sorted_songs.each do |artist|
      puts "#{sorted_songs.index(artist) + 1}. #{artist.name}"
    end  
  end
  
  def list_genres
    sorted_songs = Genre.all.sort! do |a , b|
      a.name <=> b.name
    end
    
    sorted_songs.uniq!
    
    sorted_songs.each do |genre|
      puts "#{sorted_songs.index(genre) + 1}. #{genre.name}"
    end  
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_imput = gets.chomp
    
    songs_by_artist = Song.all.select do |song|
      song.artist.name == artist_imput
    end
    
    songs_by_artist.uniq!
    
    songs_by_artist.sort! do |a, b|
      a.name <=> b.name
    end
    
    songs_by_artist.each do |song|
      puts "#{songs_by_artist.index(song) + 1}. #{song.name} - #{song.genre.name}"
    end
  end  
    
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_imput = gets.chomp
    
    songs_by_genre= Song.all.select do |song|
      song.genre.name == genre_imput
    end
    
    songs_by_genre.uniq!
    
    songs_by_genre.sort! do |a, b|
      a.name <=> b.name
    end
    
    songs_by_genre.each do |song|
      puts "#{songs_by_genre.index(song) + 1}. #{song.artist.name} - #{song.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    choice_imput = gets.chomp.to_i - 1
    sorted_songs = Song.all.sort do |a, b|
    a.name <=> b.name
    end
    #binding.pry
    sorted_songs.uniq!
    unless sorted_songs.none?(sorted_songs[choice_imput]) || (choice_imput < 1 || choice_imput > sorted_songs.length)
      song = sorted_songs[choice_imput]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
    
end