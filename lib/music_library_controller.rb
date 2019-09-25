require 'pry'
class MusicLibraryController

  def initialize(path='./db/mp3s')
    new_importer = MusicImporter.new(path).import
  end

  def call
    user_input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while user_input != 'exit' do
      user_input = gets.chomp
    end
  end

  def list_songs
    songs = Song.all.uniq
    songs.sort! {|a,b| a.name <=> b.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.uniq
    artists.sort! {|a,b| a.name <=> b.name}
    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.uniq
    genres.sort! {|a,b| a.name <=> b.name}
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    
  end


end
