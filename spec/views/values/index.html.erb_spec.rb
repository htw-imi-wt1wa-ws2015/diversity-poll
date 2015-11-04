require 'rails_helper'

RSpec.describe "values/index", type: :view do
  before(:each) do
    assign(:values, [
      Value.create!(
        :label => "Label",
        :dimension => nil
      ),
      Value.create!(
        :label => "Label",
        :dimension => nil
      )
    ])
  end

  it "renders a list of values" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
