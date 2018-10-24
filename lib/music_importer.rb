class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = normalize_file_names(get_files_at(path))
  end

  def get_files_at(path)
    Dir["#{path}/**.mp3"]
  end

  def normalize_file_names(files)
    files.map { |file| file[0..-5] }
end
