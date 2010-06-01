class ContentController < ApplicationController

  def contact
    @contact_form = ContactForm.new
  end

  def contact_submit
    @contact_form = ContactForm.new params[:contact_form]

    if @contact_form.save
      flash[:notice] = "Thank you!  Your message has been received.  "
      if @contact_form.phone_number.blank? || @contact_form.email.blank?
        flash[:notice] << "We will be in touch!"
      else
        flash[:notice] << "<br/><small>Unfortunately without contact information we won't be able to reply to you.</small>"
      end

      MailComment.deliver_comment_message @contact_form
      redirect_to root_url
    else
      flash[:error] = "There was a problem receiving your message.<br/><br/><small>#{@contact_form.errors.full_messages.to_sentence}</small>"
      render :action => "contact"
    end
  end
end