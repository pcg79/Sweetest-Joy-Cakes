require 'test_helper'

class ContentControllerTest < ActionController::TestCase
  context "The contact form is submitted" do
    setup do
      ActionMailer::Base.deliveries = []
    end

    context "with message" do
      context "and valid phone number" do
        setup do
          post :contact_submit, :contact_form => {"name" => "Test User", "phone_number" => "111-222-3333", "message" => "Thanks for my cake!"}
        end

        should_redirect_to("root path") { root_path }
        should_set_the_flash_to "Thank you!  Your message has been received.  We will be in touch!"

        should "send an email" do
          emails = ActionMailer::Base.deliveries
          assert !emails.empty?, "No emails were sent"
        end
      end

      context "and valid email address" do
        setup do
          post :contact_submit, :contact_form => {"name" => "Test User", "email" => "test@user.com", "message" => "Thanks for my cake!"}
        end

        should_redirect_to("root path") { root_path }
        should_set_the_flash_to "Thank you!  Your message has been received.  We will be in touch!"
        should "send an email" do
          emails = ActionMailer::Base.deliveries
          assert !emails.empty?, "No emails were sent"
        end
      end

      context "but without email or phone number" do
        setup do
          post :contact_submit, :contact_form => {"name" => "Test User", "message" => "Thanks for my cake!"}
        end

        should_redirect_to("root path") { root_path }
        should_set_the_flash_to "Thank you!  Your message has been received.  <br/><small>Unfortunately without contact information we won't be able to reply to you.</small>"
        should "send an email" do
          emails = ActionMailer::Base.deliveries
          assert !emails.empty?, "No emails were sent"
        end
      end
    end

    context "without message" do
      setup do
        post :contact_submit, :contact_form => {"name" => "Test User", "email" => "test@user.com"}
      end

      should_render_template :contact
      should_set_the_flash_to(/There was a problem receiving your message.<br\/><br\/><small>/i)

      should "not have sent an email" do
        emails = ActionMailer::Base.deliveries
        assert emails.empty?, "Emails were sent"
      end
    end
  end
end
