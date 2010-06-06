require 'test_helper'

class ContactFormLintTest < ActiveModel::TestCase
  include ActiveModel::Lint::Tests

  class ContactForm
    extend ActiveModel::Naming

    def to_model
      self
    end

    def valid?()      true end
    def new_record?() true end
    def destroyed?()  true end

    def errors
      obj = Object.new
      def obj.[](key)         [] end
      def obj.full_messages() [] end
      obj
    end
  end

  def setup
    @model = ContactForm.new
  end
end