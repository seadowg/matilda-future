require "observer"

class Promise
  def initialize
    @value = nil
    @set = false
  end

  def future
    unless @future
      @future = Future.new
      @future.set(@value) if @set
    end

    @future
  end

  def set(value)
    unless @set
      @future.set(value) if @future
      @value = value
      @set = true
    end
  end
end
