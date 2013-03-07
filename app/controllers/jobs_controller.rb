class JobsController < ApplicationController

  def index
    @jobs = Job.paginate(page: params[:page], per_page: 20)
  end

  def show
    @job = Job.find(params[:id])
  end
end