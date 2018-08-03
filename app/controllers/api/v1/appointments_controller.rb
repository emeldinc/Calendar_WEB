class Api::V1::AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
	end

	def index
		@appointments = Appointment.all
		render json: @appointments
	end

	def show
		render json: @appointment = Appointment.find(params[:id])
	end

	def delete_all
		@appointments = Appointment.all
		@appointments.each do |appointment|
		 	appointment.destroy
	    end 
		redirect_to dashboard_path
	end

	def create
		@appointment = Appointment.new(appointment_params)
		if @appointment.save
			render json: @appointment, status: :created, location: api_v1_appointment_url(@appointment)
		else
			render json: @appointment.errors, status: :unprocessable_entity
		end
	end

	def update
		if @appointment.update(appointment_params)
			render json: @appointment
		else
			render json: @appointment.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@appointment = Appointment.find(params[:id])
		@appointment.destroy
	end

  	def recursive
  		@appointment = Appointment.find(params[:id])
  	end

  	def create_recursive
	i = 0
		loop do
		  i += 1
		  if params[:type] == '1'
		  	params[:appointment][:date] = params[:appointment][:date].to_time.to_i+7.day
		  	params[:appointment][:date] = Time.at(params[:appointment][:date]).strftime("%Y/%m/%d")
		  	
		  end
		  if params[:type] == '2'
		  	params[:appointment][:date] = params[:appointment][:date].to_time.to_i+1.month
		  	params[:appointment][:date] = Time.at(params[:appointment][:date]).strftime("%Y/%m/%d")
		  	
		  end
		  if params[:type] == '3'
		  	params[:appointment][:date] = params[:appointment][:date].to_time.to_i+1.year
		  	params[:appointment][:date] = Time.at(params[:appointment][:date]).strftime("%Y/%m/%d")
		  	
		  end
		  @appointment = Appointment.new(appointment_params)
			if @appointment.save

			  else
			    render 'recursive'
			    break
			  end
		  if i == params[:length]["{:required=>true}"].to_i
		    break      
		  end
		end 
		redirect_to dashboard_path
  	end




	def edit
		@appointment = Appointment.find(params[:id])
	end



	private
	  def appointment_params
	    params.require(:appointment).permit(:title, :comment, :date, :start_time, :end_time)
	  end
end
