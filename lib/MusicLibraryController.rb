require 'pry'
require_relative 'Song.rb'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    imported = MusicImporter.new(path)
    imported.import
  end 
  
  def call 
    input = nil 
    while input != 'exit'
    
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
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres 
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end
    end
  end
  
  
  
  
  
  
  def list_songs
   sorted_songs = Song.all.sort_by {|song| song.name}
    
    sorted_songs.uniq.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  
  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end 
  end 
  
  
  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    #binding.pry
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end 
  
   def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
     if artist = Artist.find_by_name(input) 
     
      sorted_songs = artist.songs.sort_by do |song|
        song.name
      end
      
      sorted_songs.each.with_index do |song,index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      
      sorted_songs = genre.songs.sort_by do |song|
        song.name 
      end 
      
      sorted_songs.each.with_index do |song, index|
        puts "#{index +1}. #{song.artist.name} - #{song.name}"
      end 
    end
  end 
  
  
    def play_song
    puts "Which song number would you like to play?"
    list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }

    input = gets.strip.to_i
    #if (input > 0) && (input <= list_of_songs.size)
    #if (input >= 1) && (input <= list_of_songs.size)
    
      
    if (1..Song.all.length).include?(input) && input != 6
      song = list_of_songs[input+2]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
  
  
  
end




