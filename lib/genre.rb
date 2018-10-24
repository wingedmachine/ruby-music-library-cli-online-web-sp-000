class Genre
  extend Concerns::Findable
  extend Concerns::Trackable::ClassMethods
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name, :songs

  def artists
    through_Songs_has_many(:artist)
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
    song.genre ||= self
  end
end
