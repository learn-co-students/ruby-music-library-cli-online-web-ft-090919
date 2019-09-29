class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    while((selection = gets.strip) != "exit")
      case selection
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end
    end
  end

  def list_songs
    song_array.each.with_index(1) { |song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.sort_by { |artist| artist.name }.each.with_index(1) { |artist, i| puts "#{i}. #{artist.name}" }
  end

  def list_genres
    Genre.all.sort_by { |artist| artist.name }.each.with_index(1) { |artist, i| puts "#{i}. #{artist.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    Song.all.select { |song| song.artist.name == artist_name }.sort_by { |song| song.name }.each.with_index(1) { |song, i| puts "#{i}. #{song.name} - #{song.genre.name}" }

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    Song.all.select { |song| song.genre.name == genre_name }.sort_by { |song| song.name }.each.with_index(1) { |song, i| puts "#{i}. #{song.artist.name} - #{song.name}" }
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    song = song_array[number - 1] if number.between?(1, song_array.length)
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

  private
  def song_array
    Song.all.sort_by { |song| song.name }
  end

end

