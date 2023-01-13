require 'rails_helper'

RSpec.describe 'doctor show page' do 
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor_1 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University" )
    @doctor_2 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University" )
    @doctor_3 = @hospital_2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania" )

  end

  describe 'US1' do 
    describe 'When I visit a doctors show page' do
      it 'shows all of that doctors information including name specialty university' do
        visit "/doctors/#{@doctor_1.id}"
save_and_open_page
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.specialty)
        expect(page).to have_content(@doctor_1.university)
        expect(page).to_not have_content(@doctor_2.name)
      end
    end
  end
end