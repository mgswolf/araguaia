class Admin::LaboratoryItemsController < Admin::BaseController
  before_filter :get_laboratory_item, only: [:show, :edit, :update, :destroy]

  def index
    @search = LaboratoryItem.search(params[:search])
    @laboratory_items = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @laboratory_item = LaboratoryItem.new
  end

  def edit

  end

  def create
    @laboratory_item = LaboratoryItem.new(params[:laboratory_item])
    if @laboratory_item.save
      redirect_to [:admin,@laboratory_item], notice: t('laboratory_items.create.notice')
    else
      flash[:alert] = t('laboratory_items.create.alert')
      render 'new'
    end
  end

  def update
    if @laboratory_item.update_attributes(params[:laboratory_item])
      redirect_to [:admin,@laboratory_item], notice: t('laboratory_items.update.notice')
    else
      flash[:alert] = t('laboratory_items.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @laboratory_item.destroy
      redirect_to admin_laboratory_items_path, notice: t('laboratory_items.destroy.notice')
    else

    end
  end

  private
  def get_laboratory_item
    @laboratory_item = LaboratoryItem.find(params[:id])
  end
end
