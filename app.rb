require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/project'
require './lib/volunteer'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "volunteer_tracker"})

get '/' do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

post '/project' do
  project = params.fetch("project")
  new_project = Project.new(:name => project, :id => nil)
  new_project.save
  @projects = Project.all
  erb(:index)
end

post '/volunteer' do
  volunteer = params.fetch('volunteer')
  project_id = params.fetch('project_id').to_i
  new_volunteer = Volunteer.new(:name => new_volunteer, :project_id => project_id, :id => nil)
  new_volunteer.save
  @volunteers = Volunteer.all
  erb(:index)
end
