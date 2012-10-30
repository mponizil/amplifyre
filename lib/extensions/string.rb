class String
  def cap_words
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end
end
