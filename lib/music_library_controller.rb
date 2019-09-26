
class MusicLibraryController

  attr_accessor :songs, :folderpath

  def initialize(filepath='./db/mp3s')
    @folderpath = filepath
    MusicImporter.new(filepath).import
  end

  def call

    user_input = ""

    puts "Welcome to your music library!"

    while user_input.downcase != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp

      list_songs if user_input == "list songs"
      list_artists if user_input == "list artists"
      list_songs_by_artist if user_input == "list artist"
      list_genres if user_input == "list genres"
      list_songs_by_genre if user_input == "list genre"
      play_song if user_input == "play song"
    end

  end

  def list_songs

    sorted_songs = Song.all.sort_by {|song| song.name }

    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }

    sorted_songs
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name }
    sorted_artists.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}" }
    sorted_artists
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name }
    sorted_genres.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
    sorted_genres
  end

  def list_songs_by_artist

    puts "Please enter the name of an artist:"
    response = gets.chomp

    artist = Artist.all.find {|artist| artist.name == response }

    if artist
      sorted_songs = artist.songs.sort_by {|song| song.name }

      sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end

  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets.chomp

    genre = Genre.all.find {|genre| genre.name == response }

    if genre

      sorted_songs = genre.songs.sort_by {|song| song.name }

      sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}

    end
  end


  def play_song

    response = nil
    sorted_songs = Song.all.sort_by {|song| song.name }

    puts "Which song number would you like to play?"
    response = gets.chomp

    index = response.to_i - 1

    if index > 0 && index < sorted_songs.size

      puts "Playing #{sorted_songs[index].name} by #{sorted_songs[index].artist.name}"

    end

  end

end
