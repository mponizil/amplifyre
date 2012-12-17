class File
  def self.get_title(filename)
    filename.sub!('_', ' ')
    filename.chomp!(File.extname(filename))
  end
end
