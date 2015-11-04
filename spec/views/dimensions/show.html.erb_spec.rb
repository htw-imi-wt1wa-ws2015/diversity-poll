require 'rails_helper'

RSpec.describe "dimensions/show", type: :view do
  before(:each) do
    @dimension = assign(:dimension, Dimension.create!(
      :name => "Name",
      :description => "MyText"
    ))
    @values = assign(:values,@dimension.values)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
