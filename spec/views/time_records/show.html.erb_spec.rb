require 'rails_helper'

RSpec.describe "time_records/show", type: :view do
  before(:each) do
    @time_record = assign :time_record, create(:time_record)
    @user = assign :user, @time_record.user
  end

  it "renders attribute values" do
    render

    expect(rendered).to include(@user.display_name)
    expect(rendered).to include("2019-09-11")
    expect(rendered).to include("1.11")
    expect(rendered).to include("A usual description for time record")
  end
end
