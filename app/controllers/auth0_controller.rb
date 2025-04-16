require "uri"
require "net/http"

class Auth0Controller < ApplicationController
  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params["message"]
  end

  def login
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG["auth0_client_id"]
    }

    URI::HTTPS.build(host: AUTH0_CONFIG["auth0_domain"], path: "/v2/logout", query: request_params.to_query).to_s
  end
end
