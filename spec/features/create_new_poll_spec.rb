require 'rails_helper'

describe "creating a new poll", type: :feature do
  before :each do
    @poll_name = "Test Poll"
    Poll.create(name: @poll_name)
  end
  it "root page shows the poll" do
    visit root_path
    expect(page).to have_content @poll_name
  end
  it "new button goes to new Poll page" do
    visit root_path
    #save_and_open_page
    click_link 'New'
    expect(page).to have_content "New Poll"
  end
  it "creates a new poll" do
    expect do
      visit new_poll_path
      fill_in 'Name', with: 'Poll created by test'
      fill_in 'Description', with: 'bla bla bla'
      click_button 'Create Poll'
    end.to change{Poll.count}.by(1)
  end

end
