class Admin::JobsController < Admin::BaseController
  before_filter :get_job, only: [:show, :edit, :update, :destroy]

  def index
    @search = Job.search(params[:search])
    @jobs = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @job = Job.new
  end

  def edit

  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to [:admin,@job], notice: t('jobs.create.notice')
    else
      flash[:alert] = t('jobs.create.alert')
      render 'new'
    end
  end

  def update
    if @job.update_attributes(params[:job])
      redirect_to [:admin,@job], notice: t('jobs.update.notice')
    else
      flash[:alert] = t('jobs.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @job.destroy
      redirect_to admin_jobs_path, notice: t('jobs.destroy.notice')
    else
      redirect_to admin_jobs_path, notice: t('jobs.destroy.alert')
    end
  end

  private
  def get_job
    @job = Job.find(params[:id])
  end
end
