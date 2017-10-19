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
      Page.cambridge
  end

  def norfolk_site?
    false
  end#

  def site_url
      'https://apprenticeshipscambridgeshire.org'
  end

  def site_email
      %w[
        jgoddard@citycollegepeterborough.ac.uk
        dchalmers@citycollegepeterborough.ac.uk
      ]
  end

  #def site_email
  #  if norfolk_site?
  #    "shane@cd2solutions.co.uk"
  #  else
  #    "hexmodr@gmail.com"
  #  end
  #end

end
