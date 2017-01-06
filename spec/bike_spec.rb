require "bike.rb"

describe Bike do
  bike = Bike.new
  it "responds to method 'working?'" do
    expect(bike).to be_working
  end

describe "when bike is broken" do
  it "allows the user to report that the bike is broken" do
    expect(subject).to respond_to(:report_broken)
  end
  it "sets broken to true" do
    bike.report_broken
    expect(bike.report_broken).to eq true
  end
end
end
