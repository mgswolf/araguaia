class Admin::BannersController < Admin::BaseController
  before_filter :get_banner, only: [:show, :edit, :update, :destroy]

  def index
    @banners = Banner.paginate(page: params[:page])
  end

  def show

  end

  def new
    @banner = Banner.new
  end

  def edit

  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      redirect_to [:admin,@banner], notice: t("flash.admin.banners.create.notice")
    else
      flash.now[:alert] = t("flash.admin.banners.create.alert")
      render "new"
    end
  end

  def update
    if @banner.update_attributes(params[:banner])
      redirect_to [:admin,@banner], notice: t("flash.admin.banners.update.notice")
    else
      flash.now[:alert] = t("flash.admin.banners.update.alert")
      render "edit"
    end
  end

  def destroy
    @banner.destroy
    redirect_to admin_banners_path, notice: t("flash.admin.banners.destroy.notice")
  end
  private
    def get_banner
      @banner = Banner.find(params[:id])
    end
end