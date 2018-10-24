module Concerns::HasManySongs
  def add_song(song, string)
    @songs << song unless @songs.include?(song)
    song.send("#{string}=", self) unless song.send(string)
    # song.artist ||= self
  end

  def through_songs_has_many(objects)
    @songs.map(&objects).uniq
  end
end
