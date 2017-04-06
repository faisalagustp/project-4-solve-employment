module ApplicationHelper
  def render_stars(value)
   output = ''
   if (1..5).include?(value.to_i)
     value.to_i.times { output += '*'}
   end
   output
 end

 def resource_name
   :user
 end

 def resource_class
   User
 end

 def resource
   @resource ||= User.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
 end

end
