require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctor_patients }
  it { should have_many(:doctors).through(:doctor_patients) }

  describe 'adults in alphabetical order' do
    it 'has an age greater than 18' do
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

   
      expect(Patient.adults_alphabetically.sort).to eq([patient_1.name, patient_2.name, patient_3.name].sort)
    end
  end
end