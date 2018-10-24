class Artist
  extend Concerns::Findable
  extend Concerns::Trackable::ClassMethods
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name, :songs

  def genres
    @songs.map(&:genre).uniq
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
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
