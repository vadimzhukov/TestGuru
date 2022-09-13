module FlashHelper
  def flash_messages(messages)
    messages.map { |_key, _value| content_tag(:p, _value.to_s, class: "flash #{_key}") }.join('').html_safe
  end
end
