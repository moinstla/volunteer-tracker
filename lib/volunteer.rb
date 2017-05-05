class Volunteer
  attr_accessor(:name, :project_id, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id).to_i
  end

  def == (another_volunteer)
    self.name.==(another_volunteer.name)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    results.each do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end
end
