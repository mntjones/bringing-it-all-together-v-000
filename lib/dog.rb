class Dog
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(dog)
    @id = nil
    @name = dog[:name]
    @type = dog[:breed]
  end
  
  def Dog::create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT")
  end
  
  def Dog::drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end
  
  def Dog::new_from_db(dog)
    Dog.new(dog[0], dog[1], dog[2])
  end
  
  def Dog::find_by_name(name)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ?", name).flatten
    Dog.new(dog[0], dog[1], dog[2])
  end
  
  def update
    DB[:conn].execute("UPDATE dogs SET name = ?, breed = ? WHERE id = ?", self.name, self.breed, self.id)
  end
  
  def save
    if self.id
      self.update
    else
      DB[:conn].execute("INSERT INTO dogs (name, breed) VALUES (?, ?)", self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs ")[0][0]
    end
  end
end