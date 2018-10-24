class Song
  attr_accessor :name, :genres
  attr_reader :artist

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
end
