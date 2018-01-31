class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?  

  before_action :load_meta_tags

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) { |params|
      params.permit(
        :email, :password, :password_confirmation, :first_name, :last_name, :company
      )
    }    
  end  
  
  # Needed to restrict access to a set of IP's only. We don't want random users trying to access the admin interface
  def access_denied
    if Rails.env == 'production'
      #whitelist = ['207.204.247.75', '108.171.116.70','216.169.133.105','95.152.61.59', '207.204.246.98'].freeze
      ip_arr = request.remote_ip.to_s.split(".")
      # remove last to ip parts to get like 255.255
      ip_arr.pop 
      ip_arr.pop
      request_remote_ip = ip_arr.join(".")
      
      logger.info "Admin area accessed from:" + request_remote_ip.to_s
      
      # white list contains ip address in the form like "255.255.255" i.e. without the last one  
      whitelist = ['207.204', '108.171','216.169'].freeze
      unless whitelist.include? request_remote_ip
        logger.warn "Admin area access denied to:" + request_remote_ip.to_s
        redirect_to "/", :notice => t("access_denied")
      end
    end
  end

  def load_meta_tags
    set_meta_tags site: t("meta.site_name"), title: t("general.title")
    set_meta_tags description: "Ruby On Rails Development and Training in Ahmedabad (Gujarat, India)"
    set_meta_tags keywords: %w[ruby rails angularjs web development training]
    set_meta_tags canonical: "http://www.sheltersoft.in/"
    set_meta_tags icon: '/favicon.ico'
    set_meta_tags author: "http://www.sheltersoft.in/contact-us"    
  end
  
end
