class LaboratoryController < ApplicationController
  def index
    @laboratory_items = LaboratoryItem.paginate(page: params[:page], per_page: 20)
  end

end