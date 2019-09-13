require 'rails_helper'

RSpec.describe "time_records/edit", type: :view do
  before(:each) do
    @time_record = assign :time_record, create(:time_record)
    @user = assign :user, @time_record.user
  end

  it "renders the edit time_record form" do
    render

    assert_select "form[action=?][method=?]", user_time_record_path(@user, @time_record), "post" do

      assert_select "input[name=?]", "time_record[hours]"

      assert_select "textarea[name=?]", "time_record[description]"
    end
  end
end
