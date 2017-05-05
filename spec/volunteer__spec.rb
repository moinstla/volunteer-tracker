require 'spec_helper'

describe(Volunteer) do
  describe('#name') do
    it('returns the name of the volunteer') do
      volunteer = Volunteer.new({:name =>'Martin', :project_id => 1, :id => nil})
      expect(volunteer.name).to(eq('Martin'))
    end
  end

  describe("#project_id") do
    it('returns the project id of the volunteer') do
        volunteer = Volunteer.new({:name =>'Martin', :project_id => 1, :id => nil})
      expect(volunteer.project_id).to(eq(1))
    end
  end

  describe("#id") do
    it('returns the id of the volunteer') do
        volunteer = Volunteer.new({:name =>'Martin', :project_id => 1, :id => nil})
      expect(volunteer.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it('is the same volunteer if the names are the same') do
        volunteer1 = Volunteer.new({:name =>'Martin', :project_id => 1, :id => nil})
        volunteer2 = Volunteer.new({:name =>'Martin', :project_id => 1, :id => nil})
      expect(volunteer1).to(eq(volunteer2))
    end
  end
end
