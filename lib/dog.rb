class Dog
  attr_accessor :name, :breed, :id

  def initialize(name: name, breed: breed, id: id = nil)
    @name = name 
    @breed = breed 
    @id = id
  end
end
