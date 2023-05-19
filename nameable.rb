class Nameable
  def correct_name?
    raise NotImplementedError, "Method 'correct_name' must be implemented in a subclass."
  end
end
