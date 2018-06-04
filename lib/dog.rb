class Dog
  attr_accessor :name, :breed, :id

  def initialize(name: name, breed: breed, id: id = nil)
    @name = name
    @breed = breed
    @id = id
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT)")
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE dogs")
  end

  def save
    DB[:conn].execute("INSERT INTO dogs (name, breed) VALUES (?, ?)",self.name, self.breed)
    self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end

  def self.create(dog)
    self.new(name: dog[:name], breed: dog[:breed]).save
  end

  def self.find_by_id(num)
    DB[:conn].execute("SELECT * FROM dogs WHERE id = ?",num)
  end
end
