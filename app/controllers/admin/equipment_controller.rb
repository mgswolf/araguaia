class Admin::EquipmentController < Admin::BaseController
  before_filter :get_equipment, only: [:show, :edit, :update, :destroy]

  def index
    @search = Equipment.search(params[:search])
    @equipments = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @equipment = Equipment.new
  end

  def edit

  end

  def create
    @equipment = Equipment.new(params[:equipment])
    if @equipment.save
      redirect_to [:admin,@equipment], notice: t('equipments.create.notice')
    else
      flash[:alert] = t('equipments.create.alert')
      render 'new'
    end
  end

  def update
    if @equipment.update_attributes(params[:equipment])
      redirect_to [:admin,@equipment], notice: t('equipments.update.notice')
    else
      flash[:alert] = t('equipments.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @equipment.destroy
      redirect_to admin_equipment_index_path, notice: t('equipments.destroy.notice')
    else

    end
  end

  private
  def get_equipment
    @equipment = Equipment.find(params[:id])
  end
end
