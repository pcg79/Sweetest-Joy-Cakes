class ContentController < ApplicationController

  def gallery
    redirect_to categories_path
  end

  def contact
    @contact_form = ContactForm.new
  end

  def contact_submit
    @contact_form = ContactForm.new params[:contact_form]

    if @contact_form.valid?
      notice = "Thank you!  Your message has been received.  "
      if !@contact_form.phone_number.blank? || !@contact_form.email.blank?
        notice << "We will be in touch!"
      else
        notice << "<br/><small>Unfortunately without contact information we won't be able to reply to you.</small>"
      end

      MailComment.comment_message(@contact_form).deliver
      redirect_to root_url, :notice => notice
    else
      flash.now[:error] = "There was a problem receiving your message.<br/><br/><small>#{@contact_form.errors.full_messages.to_sentence}</small>"
      render :action => "contact"
    end
  end
end