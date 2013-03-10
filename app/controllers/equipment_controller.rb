class EquipmentController < ApplicationController
  def index
    @equipments = Equipment.paginate(page: params[:page])
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
end