require 'rails_helper'

RSpec.describe "time_records/new", type: :view do
  before(:each) do
    @user = assign :user, create(:user)
    @time_record = assign :time_record, TimeRecord.new(user: @user)
  end

  it "renders new time_record form" do
    render

    assert_select "form[action=?][method=?]", user_time_records_path(@user), "post" do
      assert_select "input[name=?]", "time_record[date]"
      assert_select "input[name=?]", "time_record[hours]"
      assert_select "textarea[name=?]", "time_record[description]"
    end
  end
end
