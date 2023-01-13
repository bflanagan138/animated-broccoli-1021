require 'rails_helper'

RSpec.describe 'patient index page' do 
  
  before(:each) do
  

    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor_1 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University" )
    @doctor_2 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University" )
    @doctor_3 = @hospital_2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania" )

    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 22)

    @doctor_patient_1 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    @doctor_patient_2 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_2.id)
    @doctor_patient_3 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_3.id)
    @doctor_patient_4 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_4.id)
    @doctor_patient_5 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_4.id)
    @doctor_patient_6 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)
    @doctor_patient_7 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_2.id)
    @doctor_patient_8 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_1.id)
  end
  describe 'US3' do 
    describe 'When I visit a patient index page' do
      it 'shows all adult patient names in alphabetical order' do
        visit "/patients"
        save_and_open_page

        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_2.name)
        expect(page).to have_content(@patient_3.name)
        expect(page).to_not have_content(@patient_4.name)
        
      end
    end
  end
end