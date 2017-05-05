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
end
