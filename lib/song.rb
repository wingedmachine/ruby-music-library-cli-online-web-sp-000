class Song
  attr_accessor :name

  SONGS = []

  def self.all
    SONGS
  end

  def self.destroy_all
    SONGS.clear
  end

  def initialize(name)
    @name = name
  end

  def save(song)
    SONGS << song
  end

  def create(name)
    save(Song.new(name))
  end
end
