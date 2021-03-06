module ApplicationHelper
def notice_message
    alert_types = { :notice => :success, :alert => :danger }
    
    close_button_options = { :class => "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)
    $group_log.debug "close_button=#{close_button}"
    alerts = flash.map do |type, message|
        alert_content = close_button + message
        alert_type = alert_types[type.to_sym] || type
        alert_class = "alert alert-#{alert_type} alert-dismissable"
        content_tag(:div, alert_content, :class => alert_class)
    end
    $group_log.debug "alerts=#{alerts.join("\n").html_safe}"
    alerts.join("\n").html_safe
end

end
