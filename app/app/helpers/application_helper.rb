module ApplicationHelper
  def datepicker_input form, field
    content_tag :div, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
      form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
    end
  end

  def html_unescape string
    CGI::unescapeHTML string
  end

  def uh string
    html_unescape string
  end
end
