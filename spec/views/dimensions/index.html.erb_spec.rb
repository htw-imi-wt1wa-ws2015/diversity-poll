require 'rails_helper'

RSpec.describe "dimensions/index", type: :view do
  before(:each) do
    assign(:dimensions, [
      Dimension.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Dimension.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of dimensions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
