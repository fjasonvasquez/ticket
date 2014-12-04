require 'spec_helper'

feature "Deleting projects" do
	scenario "Deleting a project" do
		FactoryGirl.create(:project, name: "SublimeText 2")

		visit "/"
		click_link "SublimeText 2"
		click_link "Delete Project"

		expect(page).to have_content("Project has been destroyed")

		visit "/"

		expect(page).to have_no_content("SublimeText 2")
	end
end