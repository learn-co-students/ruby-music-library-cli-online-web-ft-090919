class MusicLibraryController

    def initialize(path = './db/mp3s')
        MusicImporter.new(path).import
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
        input = gets.chomp.downcase
        until input == "exit"
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
            input = gets.chomp.downcase
        end
    end
    def list_songs
        songs = Song.all.sort { |a, b| a.name <=> b.name }
        songs.each_with_index do |song, idx|
            puts "#{idx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    def list_artists
        artists = Artist.all.sort { |a, b| a.name <=> b.name }
        artists.each_with_index do |artist, idx|
            puts "#{idx+1}. #{artist.name}"
        end
    end
    def list_genres
        genres = Genre.all.sort { |a, b| a.name <=> b.name }
        genres.each_with_index do |genre, idx|
            puts "#{idx+1}. #{genre.name}"
        end
    end
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.chomp
        if Artist.find_by_name(artist)
            songs = Artist.find_by_name(artist).songs.sort { |a, b| a.name <=> b.name }
            songs.each_with_index do |song, idx|
                puts "#{idx+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre = gets.chomp
        if Genre.find_by_name(genre)
            songs = Genre.find_by_name(genre).songs.sort { |a, b| a.name <=> b.name }
            songs.each_with_index do |song, idx|
                puts "#{idx+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end
    def play_song
        puts "Which song number would you like to play?"
        number = gets.chomp.to_i
        songs = Song.all.sort { |a, b| a.name <=> b.name }
        if number.between?(1, songs.length)
            puts "Playing #{songs[number-1].name} by #{songs[number-1].artist.name}"
        end
    end
end