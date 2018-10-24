module Concerns::HasManySongs
  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def through_songs_has_many(objects, artist)
    @songs.map(&objects).uniq
    wert = song.send(artist)
    song.send("#{sender}=") unless wert
    wert
  end
end
