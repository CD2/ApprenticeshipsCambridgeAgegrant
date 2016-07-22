module ApplicationHelper


  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation' do
        "#{attribute.to_s.humanize} #{model.errors[attribute].join(", ")}"
      end
    end
  end

  def breadcrumbs current
    content_tag :div, class: 'breadcrumbs' do
      link_to('Home', 'https://www.apprenticeshipsnorfolk.org/').html_safe +
      content_tag(:div, '|', class: 'breadcrumbs__separator') +
      link_to('AGE Grant', root_url).html_safe +
      content_tag(:div, '|', class: 'breadcrumbs__separator') +
      content_tag(:strong, current)
    end
  end

  def site_pages
    if norfolk_site?
      Page.norfolk
    else
      Page.cambridge
    end
  end

  def norfolk_site?
    request.host == "localhost" || request.host == 'apprenticeship-norfolk.herokuapp.com'
  end

end