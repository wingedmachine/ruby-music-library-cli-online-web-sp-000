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

  def save
    @@all << self
  end

  def create(name)
    song = Song.new(name).save
    song
  end
end
