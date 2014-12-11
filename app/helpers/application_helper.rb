module ApplicationHelper
  def include_controller_javascript
    javascript_include_tag params[:controller] if Rails.application.assets.find_asset("#{params[:controller]}.js")
    # javascript_include_tag "#{params[:controller]}_#{params[:action]}" if OcCharts::Application.assets.find_asset("#{params[:controller]}_#{params[:action]}")
  end

  def include_controller_stylesheet
    stylesheet_link_tag params[:controller] if Rails.application.assets.find_asset("#{params[:controller]}.scss")
    # stylesheet_link_tag {params[:controller]}_#{params[:action]}" if OcCharts::Application.assets.find_asset("#{params[:controller]}_#{params[:action]}")
  end
end
