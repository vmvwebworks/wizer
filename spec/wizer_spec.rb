RSpec.describe Wizer do
  it "has a version number" do
    expect(Wizer::VERSION).not_to be nil
  end
  it "Cli class salutes the user with buenoque method" do
    expect(Wizer::Cli.buenoque).to eql("bueno que!")
  end
  it "instance has a location name" do
    @loc = Wizer::Location.new(@name = "Gava")
    expect(@loc.name).to eql("Gava")
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
end
