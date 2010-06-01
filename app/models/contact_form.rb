class ContactForm < ActiveForm
  column :name
  column :phone_number
  column :email
  column :message, :type => :text
  validates_presence_of :message
  # validate :email_or_phone_number?
  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :message => "should be like xxx@yyy.zzz",
                      :allow_blank => true

  validates_format_of :phone_number,
                      :with => /^([0-9]( |-|\.)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-|\.)?([0-9]{3}( |-|\.)?[0-9]{4}|[a-zA-Z0-9]{7})$/,
                      :message => "should be in the form of 123-123-1234",
                      :allow_blank => true

  private

  def email_or_phone_number?
    if email.blank? && phone_number.blank?
      errors.add_to_base("Either Email Address or Phone Number is required for us to reply to you!")
      false
    end
  end
end