class Dashboard::Admin::WorkshopsController < DashboardController
  def index
    @workshops = Workshop.all
  end

  def new
    @workshop = Workshop.new
  end
end
