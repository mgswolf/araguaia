class Admin::ServicesController < Admin::BaseController
  before_filter :get_service, only: [:show, :edit, :update, :destroy]

  def index
    @search = Service.search(params[:search])
    @services = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @service = Service.new
  end

  def edit

  end

  def create
    @service = Service.new(params[:service])
    if @service.save
      redirect_to [:admin,@service], notice: t('services.create.notice')
    else
      flash[:alert] = t('services.create.alert')
      render 'new'
    end
  end

  def update
   if @service.update_attributes(params[:service])
      redirect_to [:admin,@service], notice: t('services.update.notice')
    else
      flash[:alert] = t('services.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @service.destroy
      redirect_to admin_services_path, notice: t('services.destroy.notice')
    else

    end
  end

  private
  def get_service
    @service = Service.find(params[:id])
  end

end
