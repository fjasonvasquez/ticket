require 'spec_helper'

feature "Editing Projects" do
	before do
		FactoryGirl.create(:project, name: "SublimeText 2")

		visit '/'
		click_link "SublimeText 2"
		click_link "Edit Project"
	end

	scenario "Updating a project" do
		fill_in "Name", with: "SublimeText 2 beta"
		click_button "Update Project"

		expect(page).to have_content("Project has been updated.")
	end

	scenario "Updating a project with invalid attributes is bad" do
		fill_in "Name", with: ""
		click_button "Update Project"

		expect(page).to have_content("Project has not been updated.")
	end
end