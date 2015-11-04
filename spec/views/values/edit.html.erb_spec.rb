require 'rails_helper'

RSpec.describe "values/edit", type: :view do
  before(:each) do
    @value = assign(:value, Value.create!(
      :label => "MyString",
      :dimension => nil
    ))
  end

  it "renders the edit value form" do
    render

    assert_select "form[action=?][method=?]", value_path(@value), "post" do

      assert_select "input#value_label[name=?]", "value[label]"

      assert_select "input#value_dimension_id[name=?]", "value[dimension_id]"
    end
  end
end
