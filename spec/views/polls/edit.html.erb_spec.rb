require 'rails_helper'

RSpec.describe "polls/edit", type: :view do
  before(:each) do
    @poll = assign(:poll, Poll.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit poll form" do
    render

    assert_select "form[action=?][method=?]", poll_path(@poll), "post" do

      assert_select "input#poll_name[name=?]", "poll[name]"

      assert_select "textarea#poll_description[name=?]", "poll[description]"
    end
  end
end
