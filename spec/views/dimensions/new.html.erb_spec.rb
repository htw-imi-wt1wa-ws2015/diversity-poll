require 'rails_helper'

RSpec.describe "dimensions/new", type: :view do
  before(:each) do
    assign(:dimension, Dimension.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new dimension form" do
    render

    assert_select "form[action=?][method=?]", dimensions_path, "post" do

      assert_select "input#dimension_name[name=?]", "dimension[name]"

      assert_select "textarea#dimension_description[name=?]", "dimension[description]"
    end
  end
end
