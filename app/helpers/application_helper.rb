module ApplicationHelper
  def logo(size, html_class = '')
    link_to root_path do
      content_tag(:h1, class: "logo #{html_class}", style: "height: #{size}px; width: #{size}px; ") do
        content_tag(:i, '', class: 'fa fa-check-square-o')
      end
    end
  end
end
