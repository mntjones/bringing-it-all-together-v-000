class Dog
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(id=nil, name, breed)
    @id = id
    @name = name
    @breed = breed
  end
  
  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT")
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end
  
  
end