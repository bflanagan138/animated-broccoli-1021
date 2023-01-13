class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = Hospital.find_by(params[:hospital_id])
   
  end
end