module ApplicationHelper
  def flash_css_class(key)
    base = "mx-auto max-w-md p-4 rounded"
    case key.to_sym
    when :notice
      "#{base} bg-green-100 text-green-800"
    when :alert
      "#{base} bg-red-100 text-red-800"
    else
      "#{base} bg-blue-100 text-blue-800"
    end
    end
end
