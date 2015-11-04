require 'rails_helper'

RSpec.describe "polls/new", type: :view do
  before(:each) do
    assign(:poll, Poll.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new poll form" do
    render

    assert_select "form[action=?][method=?]", polls_path, "post" do

      assert_select "input#poll_name[name=?]", "poll[name]"

      assert_select "textarea#poll_description[name=?]", "poll[description]"
    end
  end
end
