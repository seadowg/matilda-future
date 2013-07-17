class Future
  def initialize(observable)
    observable.add_observer(self)
  end

  def ready?
    !!@value
  end

  def value
    @value
  end

  def update(value)
    @value = value
  end
end
