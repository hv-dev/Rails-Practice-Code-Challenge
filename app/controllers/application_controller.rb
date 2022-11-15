class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_signin
    unless current_blogger
        session[:intended_url] = request.url
        redirect_to new_session_url, alert: "Please signin first!"
    end
  end

  def current_blogger
      @current_blogger ||= blogger.find(session[:blogger_id]) if session[:blogger_id]
  end

  def current_blogger?(blogger)
      @current_blogger == blogger
  end

  helper_method :current_blogger
  helper_method :current_blogger?
end
