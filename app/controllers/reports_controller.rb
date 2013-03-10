class ReportsController < ApplicationController
  before_filter :authenticate_user!, only: :show
  def index
    redirect_to report_path(current_user) if current_user
  end

  def show
    @reports = current_user.reports
  end
end