require 'spec_helper'

describe(Project) do
  describe('#name') do
    it('returns the name of the project') do
      project = Project.new({:name => "Beach Cleanup", :id => nil})
      expect(project.name).to(eq("Beach Cleanup"))
    end
  end

  describe('#id') do
    it('returns the id of the project') do
      project = Project.new({:name => "Beach Cleanup", :id => nil})
      expect(project.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('is the same project if the names are the same') do
      project1 = Project.new({:name => "Beach Cleanup", :id => nil})
      project2 = Project.new({:name => "Beach Cleanup", :id => nil})
      expect(project1).to(eq(project2))
    end
  end

  describe("#save") do
    it("saves a projects's information") do
        project = Project.new({:name => "Beach Cleanup", :id => nil})
        project.save
        expect(Project.all).to(eq([project]))
    end
  end

  describe('.all') do
    it('starts as an empty array') do
      expect(Project.all).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a project by its id') do
        project1 = Project.new({:name => "Beach Cleanup", :id => nil})
        project1.save
        project2 = Project.new({:name =>'Community Garden', :project_id => 2, :id => nil})
        project2.save
      expect(Project.find(project2.id)).to(eq(project2))
    end
  end

  describe('#volunteers') do
    it('returns a list of volunteers for a project') do
      project = Project.new({:name => "Beach Cleanup", :id => nil})
      project.save
      volunteer1 = Volunteer.new({:name =>'Martin', :project_id => project.id, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name =>'Amanda', :project_id => project.id, :id => nil})
      volunteer2.save
      expect(project.volunteers).to(eq([volunteer1, volunteer2]))


    end
  end
end
