class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = get_files_at(path)
  end

  def get_files_at(path)
    Dir["#{path}/**.mp3"].map { |file| file.sub(path, "") }
  end
end
