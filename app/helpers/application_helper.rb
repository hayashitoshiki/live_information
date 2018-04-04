module ApplicationHelper
  def active_class_for controller_name
   'active' if params[:controller] == controller_name
 end
end
