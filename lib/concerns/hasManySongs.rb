module HasManySongs
  def through_Songs_has_many(objects)
    @songs.map(&objects).uniq
  end
end
