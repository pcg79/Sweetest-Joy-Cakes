class MailComment < ActionMailer::Base
  def comment_message(contact_form)
    @name         = contact_form.name
    @email        = contact_form.email
    @message      = contact_form.message
    @phone_number = contact_form.phone_number

    to = ["joy.suguitan@gmail.com", "pat.george@gmail.com", "sweetestjoycakes@gmail.com"]

    mail :to => to, :from => contact_form.email || "Unknown <pat.george@gmail.com>", :subject => "Contact from Sweetest Joy Cakes"
  end
end