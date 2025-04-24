# ./config/initializers/auth0.rb
AUTH0_CONFIG = Rails.application.config_for(:auth0)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    AUTH0_CONFIG["auth0_client_id"],
    AUTH0_CONFIG["auth0_client_secret"],
    AUTH0_CONFIG["auth0_domain"],
    authorize_params: {
      scope: "admin openid profile",
      audience: AUTH0_CONFIG["auth0_audience"],
      redirect_uri: AUTH0_CONFIG["auth0_callback_url"]
    }
  )
end
