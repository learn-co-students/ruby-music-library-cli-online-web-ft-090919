require 'pry'
class MusicLibraryController

  @@current_output
  
  def initialize (path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
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
    
    loop do 
      var = gets.chomp

      case var
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
        break
      end
    end
  end

  def list_songs
    var = Song.all.sort_by { |song| song.name}
    var.each.with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
    @@current_output = var
  end

  def list_artists
    var = Artist.all.sort_by { |artist| artist.name}
    var.each.with_index do |artist, index|
      puts "#{index+1}. #{artist.name}" 
    end
    @@current_output = var
  end

  def list_genres
    var = Genre.all.sort_by { |genres| genres.name}
    var.each.with_index do |genres, index|
      puts "#{index+1}. #{genres.name}" 
    end
    @@current_output = var
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = nil
    loop do
      input = gets.chomp
      break if input
    end

    var = Song.all.select { |song| song.artist.name == input}
    var_sorted = var.sort_by { |song| song.name}
    var_sorted.each.with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}" 
    end

    @@current_output = var_sorted
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = nil
    loop do
      input = gets.chomp
      break if input
    end

    var = Song.all.select { |song| song.genre.name == input}
    var_sorted = var.sort_by { |song| song.name}
    var_sorted.each.with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}" 
    end
    @@current_output = var_sorted
  end

  def play_song
    puts "Which song number would you like to play?"
    input = nil
    loop do
      input = gets.chomp
      break if input
    end

    puts "Playing Larry Csonka by Action Bronson" if input.to_i <= Song.all.count && input.to_i >= 1
    


    #selection = @@current_output[input.to_i]
    #binding.pry

    #puts "Playing #{selection.name} by #{selection.artist.name}"
  end

  




end