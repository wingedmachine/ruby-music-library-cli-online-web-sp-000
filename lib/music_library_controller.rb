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

  def sort_by_name(array)
    array.sort { |item1, item2| item1.name <=> item2.name }
  end

  def list_songs
    sort_by_name(Song.all).each_with_index do |song, i|
      puts "#{i+ 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort_by_name(Artist.all).each_with_index do |artist, i|
      puts "#{i+ 1}. #{artist.name}"
    end
  end

  def list_genres
    sort_by_name(Genre.all).each_with_index do |genre, i|
      puts "#{i+ 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    loop do
      input = gets.strip
      break if (artist = Artist.find_by_name(input))
    binding.pry
    sort_by_name(artist.songs).each_with_index do |song, i|
      puts "#{i+ 1}. #{song.name} - #{song.genre}"
    end
  end

  def list_songs_by_genre
    # sort_by_name(Genre.all).each_with_index do |genre, i|
    #   puts "#{i+ 1}. #{genre.name}"
    # end
  end
end
