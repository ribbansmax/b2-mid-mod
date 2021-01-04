require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movies}
  end

  describe "model methods" do
    it "scopes by age" do
      james = Actor.create(name: "James Earl Jones", age: 65)
      carrie = Actor.create(name: "Carrie Fisher", age: 45)
      mark = Actor.create(name: "Mark Hammill", age: 55)

      expect(Actor.all.pluck(:name)).to eq([carrie.name, mark.name, james.name])
    end

    it "returns average age" do
      james = Actor.create(name: "James Earl Jones", age: 65)
      carrie = Actor.create(name: "Carrie Fisher", age: 45)
      mark = Actor.create(name: "Mark Hammill", age: 55)

      expect(Actor.average_age).to eq(55)
      # janky test below- figure out why limit does not allow method to work
      # skywalkers = Actor.limit(2)
      # expect(skywalkers.average_age).to eq(50)
    end
  end
end
