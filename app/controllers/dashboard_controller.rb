class DashboardController < ApplicationController
	def index
		@appointments = Appointment.search(params[:search])
	end
end
