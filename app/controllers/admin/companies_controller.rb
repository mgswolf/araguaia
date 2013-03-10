class Admin::CompaniesController < Admin::BaseController
  before_filter :get_company, only: [:show, :edit, :update, :destroy]

  def index
    @search = Company.search(params[:search])
    @companies = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @company = Company.new
  end

  def edit

  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to [:admin, @company], notice: t("flash.admin.companies.create.notice")
    else
      flash[:alert] = t("flash.admin.companies.create.alert")
      render "new"
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to [:admin,@company], notice: t("flash.admin.companies.update.notice")
    else
      flash[:alert] = t("flash.admin.companies.update.alert")
      render "edit"
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_path, notice: t("flash.admin.companies.destroy.notice")
  end

  private
    def get_company
      @company = Company.find(params[:id])
    end
end