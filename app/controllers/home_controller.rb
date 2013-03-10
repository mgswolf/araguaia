class HomeController < ApplicationController
  def index
    @banners = Banner.limit(4)
    @services = Service.normal
    @highlights = Service.highlights
    @lab_items = LaboratoryItem.all
    @jobs = Job.recent
  end
end
