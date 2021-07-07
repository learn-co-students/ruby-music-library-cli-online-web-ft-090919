class MusicLibraryController

  attr_accessor :path, :gets

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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

     input = gets.strip

      case input
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
          song_list = Song.all.sort_by { |song| song.name }
          song_list.each.with_index(1) { |song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }

  end

  def list_artists
          artist_list = Artist.all.sort_by { |artist| artist.name }
          artist_list.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name}"}
  end

  def list_genres
    g_list = Genre.all.sort_by { |genre| genre.name }
    g_list.each.with_index(1) {|genre, i| puts "#{i}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    if Artist.all.find { |x| x.name == input }
      artist = Artist.all.find { |x| x.name == input }
      list = artist.songs.sort_by {|song| song.name}
      list.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if this_genre = Genre.find_by_name(input)
      gen_re = this_genre.songs.sort_by{|genre|genre.name}
      gen_re.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end


  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i #input is string strip convert top int
    song_list = Song.all.sort_by{ |song| song.name } #sorts songs alph by name
      unless input == 0
      if song_list.member?(song_list[input -1])
        play_song = song_list[input -1]
        puts "Playing #{play_song.name} by #{play_song.artist.name}"
        end
      end
  end


end
