class Dog
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(id=nil, name, breed)
    @id = id
    @name = name
    @breed = breed
  end
  
  def create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs")
  end
  
  
end