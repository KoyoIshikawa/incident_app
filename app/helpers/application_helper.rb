module ApplicationHelper
  def max_width
    
    if devise_controller?
      "mw-sm"
    elsif controller.action_name == "index"
      "mw-xl"
    else
      "mw-md"
    end
  end
end