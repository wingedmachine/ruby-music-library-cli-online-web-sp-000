class Song
  extend Concerns::Findable
  extend Concerns::Trackable::ClassMethods
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename[0..-5].split(" - ")
    song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song
  end


end
