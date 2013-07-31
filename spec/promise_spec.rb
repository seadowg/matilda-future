require 'minitest/autorun'
require 'matilda-future'

describe "Promise" do
  describe "#future" do
    it "returns a Future value that is set when the Promise is set" do
      promise = Promise.new
      future = promise.future
      assert_equal(future.ready?, false)

      promise.set("Done")
      assert_equal(future.ready?, true)
      assert_equal(future.value, "Done")
    end

    it "returns a Future that is set when the Promise is set already" do
      promise = Promise.new
      promise.set("Already Done")

      future = promise.future
      assert_equal(future.ready?, true)
      assert_equal(future.value, "Already Done")
    end
  end

  describe "#set" do
    it "can only has an effect once" do
      promise = Promise.new
      future = promise.future

      promise.set("Done")
      promise.set("Done Again")

      assert_equal(future.value, "Done")
    end
  end
end
