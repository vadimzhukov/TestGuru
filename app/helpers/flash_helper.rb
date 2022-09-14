module FlashHelper
  def flash_messages(messages)
    messages.map { |key, value| content_tag(:p, value.to_s, class: "flash #{key}") }.join('').html_safe
  end
end
