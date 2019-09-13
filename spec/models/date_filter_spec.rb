require 'rails_helper'

RSpec.describe DateFilter, type: :model do
  it "parses valid date values" do
    d = DateFilter.new from: '2017-08-07', to: '2017-09-17'

    expect(d.from).to eq(Date.parse('2017-08-07'))
    expect(d.to).to eq(Date.parse('2017-09-17'))
  end

  it "replaces invalid date values with nil" do
    d = DateFilter.new from: 'bad fox', to: 'bad panda'

    expect(d.from).to be_nil
    expect(d.to).to be_nil
  end
end
