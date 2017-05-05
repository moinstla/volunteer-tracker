class Project
  attr_accessor(:name, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def == (another_project)
    self.name.==(another_project.name).&(self.id.==(another_project.id))
  end
end
