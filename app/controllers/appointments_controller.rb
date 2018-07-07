require 'active_support/core_ext'
class AppointmentsController < ApplicationController
	def new
		@appointment = Appointment.new
	end

	def show
      @appointment = Appointment.find(params[:id])
  	end

  	def recursive
  		@appointment = Appointment.find(params[:id])
  	end

  	def create_recursive
  		i = 0
		loop do
		  i += 1
		  	params[:appointment][:date] = params[:appointment][:date].to_time.to_i+7.day
		  	params[:appointment][:date] = Time.at(params[:appointment][:date]).strftime("%Y/%m/%d")
		  	@appointment = Appointment.new(appointment_params)
			if @appointment.save

			  else
			    render 'recursive'
			    break
			  end
		  if i == params[:appointment][:week].to_i
		    break      
		  end
		end 
		redirect_to dashboard_path
  	end

	def create
	  @appointment = Appointment.new(appointment_params)
	  if @appointment.save
	    redirect_to @appointment
	  else
	    render 'new'
	  end
	end

	def destroy
	    @appointment = Appointment.find(params[:id])
	    @appointment.destroy
	 	redirect_to dashboard_path
  	end

	def edit
		@appointment = Appointment.find(params[:id])
	end

	 def update
	 	@appointment = Appointment.find(params[:id])
		 if @appointment.update(appointment_params)
		 redirect_to @appointment
	 else
		 render 'edit'
	 end
	 end

	private
	  def appointment_params
	    params.require(:appointment).permit(:title, :comment, :date, :start_time, :end_time)
	  end
end
