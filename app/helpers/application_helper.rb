# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_notices
    [:notice, :error].collect {|type| content_tag('div', flash[type], :class => type, :id => "flash") if flash[type] }
  end
end
