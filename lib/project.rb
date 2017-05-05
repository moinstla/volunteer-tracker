class Project
  attr_accessor(:name, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  def == (another_project)
    self.name.==(another_project.name).&(self.id.==(another_project.id))
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM projects;")
    projects = []
    results.each do |project|
      name = project.fetch('name')
      id = project.fetch('id').to_i
      projects.push(Project.new({:name => name, :id => id}))
    end
    projects
  end
end
