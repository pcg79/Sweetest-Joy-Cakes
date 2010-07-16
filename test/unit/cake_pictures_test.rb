require 'test_helper'

class CakePicturesTest < ActiveSupport::TestCase
  context "A Cake Picture is created" do
    context "with display_picture = true" do
      setup do
        @pic = CakePicture.create(:display_picture => true)
        puts @pic.inspect
      end

      should "be included in the display_pictures scope" do
        assert CakePicture.display_pictures.include?(@pic)
      end
    end

    context "with display_pictures = false" do
      setup do
        @pic = CakePicture.create(:display_picture => false)
      end

      should "not be included in the display_pictures scope" do
        assert ! CakePicture.display_pictures.include?(@pic)
      end
    end
  end
end
