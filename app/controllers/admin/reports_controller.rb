class Admin::ReportsController < Admin::BaseController
  before_filter :get_report, only: [:show, :edit, :update, :destroy]

  def index
    @search = Report.search(params[:search])
    @reports = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @report = Report.new
  end

  def edit

  end

  def create
    @report = Report.new(params[:report])
    if @report.save
      redirect_to [:admin,@report], notice: t('reports.create.notice')
    else
      flash[:alert] = t('reports.create.alert')
      render 'new'
    end
  end

  def update
    if @report.update_attributes(params[:report])
      redirect_to [:admin,@report], notice: t('reports.update.notice')
    else
      flash[:alert] = t('reports.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @report.destroy
      redirect_to admin_reports_path, notice: t('reports.destroy.notice')
    else

    end
  end

  private
  def get_report
    @report = Report.find(params[:id])
  end
end
