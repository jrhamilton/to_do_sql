require 'pg'

class List

  def initialize(name, id)
    @name = name
    if id >= 0
      @id = id
    end
  end

  def List.create(name)
    list = List.new(name, -1)
    list.save
  end

  def name
    @name
  end

  def id
    @id
  end

  def save(name)
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_list)
    self.name == another_list.name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      id = result['id'].to_i
      name = result['name']
      lists << List.new(name, id)
    end
    lists
  end

  def self.select(name_val)
    result = DB.exec("SELECT name FROM lists WHERE name = '#{name_val}';")
    result.first['name']
  end

end
