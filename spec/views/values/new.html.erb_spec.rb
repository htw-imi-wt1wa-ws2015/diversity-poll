require 'rails_helper'

RSpec.describe "values/new", type: :view do
  before(:each) do
    assign(:value, Value.new(
      :label => "MyString",
      :dimension => nil
    ))
  end

  it "renders new value form" do
    render

    assert_select "form[action=?][method=?]", values_path, "post" do

      assert_select "input#value_label[name=?]", "value[label]"

      assert_select "input#value_dimension_id[name=?]", "value[dimension_id]"
    end
  end
end
