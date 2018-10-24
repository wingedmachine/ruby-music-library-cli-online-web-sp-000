class Artist
  extend Concerns::Findable
  extend Concerns::Trackable::ClassMethods
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name, :songs

  def genres
    @songs.map(&:genre).uniq
  end

  @@all = []

  def all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end
end
