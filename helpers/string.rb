class String
  def clean
    self.sub("'", "").sub("&", "")
  end
end