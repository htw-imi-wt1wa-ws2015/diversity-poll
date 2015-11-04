require 'rails_helper'

RSpec.describe "dimensions/edit", type: :view do
  before(:each) do
    @dimension = assign(:dimension, Dimension.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit dimension form" do
    render

    assert_select "form[action=?][method=?]", dimension_path(@dimension), "post" do

      assert_select "input#dimension_name[name=?]", "dimension[name]"

      assert_select "textarea#dimension_description[name=?]", "dimension[description]"
    end
  end
end
