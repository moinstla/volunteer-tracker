require "capybara/rspec"
require "./app"
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the adding a new project path", {:type => :feature}) do
  it ('allows the user to add a new project') do
    visit('/')
    fill_in('project', :with => 'Beach Cleanup')
    click_button('Add Project')
    expect(page).to have_content('Beach Cleanup')
  end
end

describe("the adding a new volunteer path", {:type => :feature}) do
  it ('allows the user to add a new volunteer to a project') do
    visit('/')
    fill_in('project', :with => 'Beach Cleanup')
    click_button('Add Project')
    fill_in('volunteer', :with => 'Martin')
    click_button('Add Volunteer')
    expect(page).to have_content('Martin')
  end
end

describe('the viewing all projects path', {:type => :feature}) do
  it('allows a user to see all of the projects') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    visit('/')
    expect(page).to have_content(project.name)
  end
end


describe('the viewing all volunteers path', {:type => :feature}) do
  it('allows a user to see all of the volunteers') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    volunteer = Volunteer.new({:name =>'Martin', :project_id => project.id, :id => nil})
    volunteer.save
    visit('/')
    expect(page).to have_content(volunteer.name)
  end
end

describe("the viewing a project's volunteers path", {:type => :feature}) do
  it('allows a user to see a list of the volunteers assigned to a project') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    volunteer = Volunteer.new({:name =>'Martin', :project_id => project.id, :id => nil})
    volunteer.save
    visit('/')
    click_link(project.name)
    expect(page).to have_content("Martin")
  end
end

describe("the updating a project's name path", {:type => :feature}) do
  it('allows a user to see a rename a project') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    visit("/project/#{project.id}")
    fill_in('name',{:with => "Park Cleanup"})
    click_button("Submit")
    expect(page).to have_content("Park Cleanup")
  end
end

describe("the deleting a project path", {:type => :feature}) do
  it('allows a user to delete a project') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    visit("/project/#{project.id}")
    click_button("Delete Project")
    expect(page).to have_content("Projects")
  end
end
describe("the updating a volunteer's name path", {:type => :feature}) do
  it('allows a user to see a rename a volunteer') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    volunteer = Volunteer.new({:name =>'Martin', :project_id => project.id, :id => nil})
    volunteer.save
    visit("/volunteer/#{volunteer.id}")
    fill_in('name',{:with => "Marty"})
    click_button("Submit")
    expect(page).to have_content("Marty")
  end
end

describe("the deleting a volunteer path", {:type => :feature}) do
  it('allows a user to delete a volunteer') do
    project = Project.new({:name => "Beach Cleanup", :id => nil})
    project.save
    volunteer = Volunteer.new({:name =>'Martin', :project_id => project.id, :id => nil})
    volunteer.save
    visit("/volunteer/#{volunteer.id}")
    click_button("Delete Volunteer")
    expect(page).to have_content("Volunteers")
  end
end
