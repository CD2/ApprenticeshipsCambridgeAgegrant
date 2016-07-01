module ApplicationHelper


  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation' do
        "#{attribute.to_s.humanize} #{model.errors[attribute].join(", ")}"
      end
    end
  end

end
