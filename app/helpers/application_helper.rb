# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_notices
    html = ""

    [:notice, :error].each do |type|
      html << content_tag('div', flash[type].html_safe, :class => type, :id => "flash") if flash[type]
    end
    html.html_safe
  end
end