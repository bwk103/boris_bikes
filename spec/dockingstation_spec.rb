require "dockingstation.rb"

describe DockingStation do
  bike = Bike.new
  describe "tests with one bike in the docking_station" do
    it { expect(subject.respond_to?(:release_bike)).to eq true }
    before (:each) do
      subject.docked_bikes << bike
    end
    it "releases a bike" do
      expect(subject.release_bike()).to be_instance_of(Bike)
    end
    it "the released bike is working" do
      expect(subject.release_bike.working?).to eq true
    end
    it "#dock" do
      expect(subject.respond_to?(:dock)).to eq true
    end
    it "can be passed one bike for docking" do
      expect(subject).to respond_to(:dock).with(1).argument
    end
    it "can tell a user what bikes are docked" do
      expect(subject.docked_bikes).to include(bike)
    end
  end

  describe "tests without bikes in docking station" do
    it "doesn't allow a bike to be released if there are no bikes" do
      expect {subject.release_bike}.to raise_error(RuntimeError, "There are no docked bikes!")
    end
  end

  describe "tests for docking station capacity" do
    docking_station = DockingStation.new(50)
    it "allows a bike to be docked if the current number of bikes is less than the specified capacity" do
      (docking_station.capacity - 1).times {docking_station.docked_bikes << Bike.new}
      expect { docking_station.dock(bike) }.not_to raise_error
      last_bike = docking_station.docked_bikes[-1]
      expect(docking_station.release_bike).to eq last_bike
    end
    it "allows a maximum of the specified capacity of bikes to be docked at a time" do
      (docking_station.capacity).times {docking_station.docked_bikes << Bike.new}
      expect { docking_station.dock(bike) }.to raise_error(RuntimeError, "This docking_station is full!")
    end
    it "releases the last docked bike" do
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end
  end

  describe "docking station initialization tests" do
    it "takes an argument when DockingStation.new is called" do
        expect {DockingStation.new(80) }.not_to raise_error
    end
    it "sets capacity as per the parameter passed to it" do
      test_capacity = 50
      docking_station = DockingStation.new(test_capacity)
      expect(docking_station.capacity).to eq test_capacity
    end
  end
end
