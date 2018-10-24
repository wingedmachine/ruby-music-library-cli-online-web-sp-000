module has_many_Songs
  def has_many_through_Songs(objects)
    @songs.map(&objects).uniq
  end
end
