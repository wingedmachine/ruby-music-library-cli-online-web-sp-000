module Concerns::Trackable
  module ClassMethods
    def create(name)
      new_object = self.new(name)
      new_object.save
      new_object
    end
  end

  module InstanceMethods
    def save
      self.all << self
    end
  end
end