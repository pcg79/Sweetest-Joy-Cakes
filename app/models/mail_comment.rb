class MailComment < ActionMailer::Base
  def comment_message(contact_form)
    # recipients ["joy.suguitan@gmail.com", "pat.george@gmail.com"]
    recipients "pat.george@gmail.com"
    from contact_form.email || "Unknown <pat.george@gmail.com>"
    subject "Contact from Joy's site"
    body :name => contact_form.name, :email => contact_form.email, :message => contact_form.message, :phone_number => contact_form.phone_number
  end
end
