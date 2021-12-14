module SessionsHelper
  def flash_message(type)
    if flash.any?
      content_tag(:p, flash[type], class: "flash #{type}") if flash[type]
    end
  end
end
