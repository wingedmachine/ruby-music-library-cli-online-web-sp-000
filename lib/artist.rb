class Artist
  extend Concerns::Findable
  extend Concerns::HasManySongs
  extend Concerns::Trackable::ClassMethods
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name, :songs

  def genres
    through_Songs_has_many(:genres)
  #  @songs.map(&:genre).uniq
  end

  @@all = []

  def self.all
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
