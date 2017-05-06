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
    @volunteers = Volunteer.all
  erb(:index)
end

post '/volunteer' do
  volunteer = params.fetch('volunteer')
  project_id = params.fetch('project_id').to_i
  new_volunteer = Volunteer.new(:name => volunteer, :project_id => project_id, :id => nil)
  new_volunteer.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

get '/project/:id' do
  project_id = params.fetch('id').to_i
  @project = Project.find(project_id)
  volunteer_id = params.fetch('id').to_i
  @volunteer = Volunteer.find(volunteer_id)
  @volunteers = @project.volunteers
  erb(:project_info)
end

get '/volunteer/:id' do
  volunteer_id = params.fetch('id').to_i
  @volunteer = Volunteer.find(volunteer_id)
  erb(:volunteer_info)
end

patch '/project/:id' do
  project_id = params.fetch('id').to_i
  project = Project.find(project_id)
  new_name = params.fetch('name')
  project.update({:name => new_name})
  @project = Project.find(project_id)
  @volunteers = @project.volunteers
  erb(:project_info)
end

patch '/volunteer/:id' do
  volunteer_id = params.fetch('id').to_i
  volunteer = Volunteer.find(volunteer_id)
  new_name = params.fetch('name')
  volunteer.update({:name => new_name})
  @volunteer = Volunteer.find(volunteer_id)
  erb(:volunteer_info)
end

delete '/project/:id' do
  project_id = params.fetch('id').to_i
  project = Project.find(project_id)
  project.delete
  @projects = Project.all
  @volunteers =Volunteer.all
  erb(:index)
end

delete '/volunteer/:id' do
  volunteer_id = params.fetch('id').to_i
  volunteer = Volunteer.find(volunteer_id)
  volunteer.delete
  @projects = Project.all
  @volunteers =Volunteer.all
  erb(:index)
end
