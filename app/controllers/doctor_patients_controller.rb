class DoctorPatientsController < ApplicationController
  
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    doctor_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:id])
    doctor_patient.destroy
    
    redirect_to "/doctors/#{doctor.id}"
  end
end