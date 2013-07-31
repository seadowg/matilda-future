class Future
  def ready?
    !!@value
  end

  def value
    @value
  end

  def set(value)
    @value = value
  end
end
