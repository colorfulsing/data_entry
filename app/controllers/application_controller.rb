class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :initial_config

  def convert_to_search_expression query
    query.gsub(/\s+/,' ').strip.split(' ').map{|s|Regexp.escape(s)}.join('|')
  end

  private
    def initial_config
      @search_type = []
    end

    def admin_only_access
      redirect_to root_path if !current_user.admin?
    end

end
