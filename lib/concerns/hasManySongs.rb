module Concerns::HasManySongs
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.send("genre") ||= self
  end
  
  def through_Songs_has_many(objects)
    @songs.map(&objects).uniq
  end
end
