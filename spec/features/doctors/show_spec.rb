require 'rails_helper'

RSpec.describe 'doctor show page' do 
  
  before(:each) do
    Hospital.destroy_all
    Doctor.destroy_all
    Patient.destroy_all
    DoctorPatient.destroy_all

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
    @doctor_patient_8 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_4.id)

  end

  describe 'US1' do 
    describe 'When I visit a doctors show page' do
      it 'shows all of that doctors information including name specialty university' do
        visit "/doctors/#{@doctor_1.id}"
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.specialty)
        expect(page).to have_content(@doctor_1.university)
        expect(page).to_not have_content(@doctor_2.name)
      end

      it 'shows the name of the hospital the doctor works at' do
        visit "/doctors/#{@doctor_1.id}"
        
        expect(page).to have_content(@hospital_1.name)
        expect(page).to_not have_content(@hospital_2.name)
      end

      it 'shows all of the doctor patitent names' do
        visit "/doctors/#{@doctor_1.id}"
      
        expect(page).to have_content(@patient_1.name)
        expect(page).to_not have_content(@patient_2.name)
      end
    end

    describe 'US2' do
      it 'shows a button to remove a patient from the doctor' do
        visit "/doctors/#{@doctor_1.id}"
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_button("Remove #{@patient_1.name}")
        
        click_button "Remove #{@patient_1.name}"
        expect(page).to_not have_content(@patient_1.name)
        expect(current_path).to eq("/doctors/#{@doctor_1.id}")
       
      end

    end
  end
end