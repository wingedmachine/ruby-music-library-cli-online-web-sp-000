module Concerns::HasManySongs
  def through_Songs_has_many(objects)
    @songs.map(&objects.to_s).uniq
  end
end