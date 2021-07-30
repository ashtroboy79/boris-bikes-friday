require 'docking_station'
require 'bike'

describe DockingStation do

  # test 1
  it "respond to release bike method" do
    expect(subject).to respond_to('release_bike')
  end

  # test 2 
  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  # test 3
  it { is_expected.to respond_to(:dock).with(1).argument }

  # test 4
  it { is_expected.to respond_to(:bikes) }

  # test 5
  it "returns docked bikes" do
    dan_bike = Bike.new
    subject.dock(dan_bike)
    expect(subject.bikes.last).to eq dan_bike
  end

  describe '#release_bike' do

    # test 6
    it "raise error of there are no bikes" do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock_bike' do
    it "raise error if there are too many bikes" do
      docking_station = DockingStation.new
      expect { 21.times { docking_station.dock Bike.new } }.to raise_error "Station is at full capacity"
    end
  end

end
