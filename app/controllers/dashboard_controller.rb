require "uri"
require "net/http"
require "openssl"
require "json"

class DashboardController < ApplicationController
  def index
    @access_token = params[:access_token]
  end
end
