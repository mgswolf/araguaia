class ServicesController < ApplicationController
  def index
    @services = Service.paginate(page: params[:page], per_page: 20)
  end

end