ActionView::Base.default_form_builder = LabelingFormBuilder

ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "<span class=\"fieldWithErrors\">#{html_tag}</span>" }