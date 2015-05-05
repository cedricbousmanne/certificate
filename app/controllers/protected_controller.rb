class ProtectedController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_company

  def current_company
    @current_company ||= current_user.company
  end
end
