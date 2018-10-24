module Concerns::Findable
  def find_by_name
    self.@@all.detect { |song| song.name == name }
  end
end
