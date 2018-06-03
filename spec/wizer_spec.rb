RSpec.describe Wizer do
  it "has a version number" do
    expect(Wizer::VERSION).not_to be nil
  end
  # it "Cli class salutes the user with buenoque method" do
  #   expect(Wizer::Cli.buenoque).to eql("bueno que!")
  # end
  it "create a request that returns location weather by providing location_id and affiliate_id on tiempo.com API" do
    @inst = Wizer::Tiempo.new("1381","zdo2c683olan")
    expect(@inst.location_id).not_to be nil
    expect(@inst.affiliate_id).not_to be nil
    puts "the request url is: "+@inst.request_url
  end
  it "Shows the temperature for today" do
    @inst = Wizer::Tiempo.new("1381","zdo2c683olan")
    puts "response from the request: " + @inst.min_temperature_this_week
    expect(@inst.min_temperature_this_week.code).to eql(200)
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
end
