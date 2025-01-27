require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe '::instance methods' do
    describe "average_tech_exp" do
      it "returns the average experience of the mechanics working on a ride" do
        @amusement_park = AmusementPark.create!(name: "Amusement Park", admission_cost: 50)

        @ride_1 = Ride.create!(name: "Ride 1", thrill_rating: 10, open: true, amusement_park_id: @amusement_park.id)
        
        @tech_1 = Mechanic.create!(name: "Bill", years_experience: 10)
        @tech_2 = Mechanic.create!(name: "Ted", years_experience: 2)

        MechanicRide.create!(mechanic_id: @tech_1.id, ride_id: @ride_1.id)
        expect(@ride_1.average_tech_exp).to eq(10.0)
        
        MechanicRide.create!(mechanic_id: @tech_2.id, ride_id: @ride_1.id)
        expect(@ride_1.average_tech_exp).to eq(6.0)
      end
    end
  end
end