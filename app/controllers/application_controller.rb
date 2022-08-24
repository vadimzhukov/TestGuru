class ApplicationController < ActionController::Base
  def index
    redirect_to tests_path
  end
end
