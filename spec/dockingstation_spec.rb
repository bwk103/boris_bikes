require "dockingstation.rb"

describe DockingStation do
  describe "tests with one bike in the docking_station" do
    it { expect(subject.respond_to?(:release_bike)).to eq true }
    before (:each) do
      subject.docked_bikes << Bike.new
      subject.working_bikes << Bike.new
    end
    it "releases a bike" do
      expect(subject.release_bike()).to be_instance_of double(:bike)
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
      expect(subject.docked_bikes).to include double(:bike)
    end
  end

  describe "tests without bikes in docking station" do
    it "doesn't allow a bike to be released if there are no bikes" do
      expect {subject.release_bike}.to raise_error(RuntimeError, "There are no working bikes available!")
    end
  end

  describe "tests for specified docking station capacity" do
    docking_station = DockingStation.new(50)
    it "allows a bike to be docked if the current number of bikes is less than the specified capacity" do
      (docking_station.capacity - 1).times {docking_station.docked_bikes << double(:bike)}
      expect { docking_station.dock double(:bike) }.not_to raise_error
    end
    it "allows a maximum of the specified capacity of bikes to be docked at a time" do
      (docking_station.capacity).times {docking_station.docked_bikes << double(:bike)}
      expect { docking_station.dock double(:bike) }.to raise_error(RuntimeError, "This docking_station is full!")
    end
  end

  context "tests for default docking station capacity" do
    it "allows a bike to be docked if current number of bikes is less than the default capacity" do
      ((subject.capacity) -1).times { subject.dock(double(:bike))}
      expect { subject.dock double(:bike) }.not_to raise_error
    end
    it "allows a maximum of the default capacity of bikes to be docked at a time" do
      (subject.capacity).times { subject.dock(double(:bike))}
      expect { subject.dock(double(:bike)) }.to raise_error(RuntimeError, "This docking_station is full!")
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

  describe "issues regarding broken bikes" do
    it { is_expected.to respond_to(:dock_broken).with(1).argument }
  end

  describe "docking station will not release broken bikes" do
    docking_station = DockingStation.new
    docking_station.dock(Bike.new)
    it "will not release broken bikes" do
      expect(docking_station.release_bike.broken).to eq false
    end
  end

  describe "broken bike tests" do
    bike = Bike.new
    bike.report_broken
    docking_station = DockingStation.new
    docking_station.dock(bike)
    it "Should not release the broken bike" do
      expect {docking_station.release_bike}.to raise_error(RuntimeError, "There are no working bikes available!")
    end
  end
end
