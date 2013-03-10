class CompanyController < ApplicationController
  def index
    @companies = Company.paginate(page: params[:page])
  end
end