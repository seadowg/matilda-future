require "observer"

class Promise
  include Observable

  def initialize
    @value = nil
    @set = false
  end

  def future
    future = Future.new(self)
    future.update(@value) if @set
    future
  end

  def set(value)
    unless @set
      changed
      notify_observers(value)

      @value = value
      @set = true
    end
  end
end
