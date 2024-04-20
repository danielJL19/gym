class DashboardController < ApplicationController
  layout 'dashboard_layout'
  before_action :authenticate_user!
end
