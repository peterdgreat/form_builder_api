class ApplicationController < ActionController::API
  # before_action :allow_iframe_requests
  # after_filter :allow_iframe

  private

  def allow_iframe_requests
    response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"

    # response.headers['Content-Security-Policy'] = "frame-ancestors 'self' http://localhost:3000"
  end
end
