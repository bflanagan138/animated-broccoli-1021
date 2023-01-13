require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctor_patients }
  it { should have_many(:doctors).through(:doctor_patients) }

  describe 'adult' do
    before(:each) do
      Patient.destroy_all

      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    end

    it 'has an age greater than 18' do
      expect(@patient_1.adult).to be(true)
      expect(@patient_4.adult).to be(false)
    end
  end
end