class ContactForm
  include ActiveModel::Validations

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

  attr_accessor :name, :phone_number, :email, :message

  def initialize(attributes = {})
    @attributes   = attributes
    @name         = attributes["name"]
    @phone_number = attributes["phone_number"]
    @email        = attributes["email"]
    @message      = attributes["message"]
  end

  def read_attribute_for_validation(key)
    @attributes[key.to_s]
  end

  # PRIMARY_KEYS = [ :name, :phone_number, :email, :message ]
  # def to_key
  #   return nil if new_record?
  #   PRIMARY_KEYS
  # end
  #
  # def persist
  #   @persisted = true
  # end
  #
  # def persisted?
  #   @persisted
  # end

  private

  def email_or_phone_number?
    if email.blank? && phone_number.blank?
      errors.add_to_base("Either Email Address or Phone Number is required for us to reply to you!")
      false
    end
  end
end
