class Song
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name)
    @name = name
  end

  def save(song)
    @@all << song
  end

  def create(name)
    save(Song.new(name))
  end
end
