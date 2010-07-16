require 'test_helper'

class CakeTest < ActiveSupport::TestCase
  should "be valid" do
    assert Cake.new.valid?
  end
end
