module FlashHelper
  def flash_messages(messages)
    flashes_html = messages.map do |key, value|
      content_tag(:p, value.to_s, class: "alert #{key}")
    end.join('').html_safe
  end
end
