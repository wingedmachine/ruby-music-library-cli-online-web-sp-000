class MusicLibraryController
  def initialize(path = "./db/mp3s")
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
    loop do
      input = gets.strip
      break if input == "exit"
    end
  end

  def list_songs
    all_songs = Song.all.sort { |song1, song2| song1.name <=> song2.name }
    all_songs.each_with_index do |song, i|
      puts "#{i+ 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    all_artists = Artist.all.sort { |artist1, artist2| artist1.name <=> artist2.name }
  end
end
