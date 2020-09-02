class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :initial_config

  private
    def initial_config
      @search_type = []
    end

end
