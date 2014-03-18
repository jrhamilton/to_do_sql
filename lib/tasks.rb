require 'pg'

class Task
  def initialize(id, name, list_id)
    @name =name
    @list_id = list_id
    @id = id
  end

  def Task.create(name, list_id)
    task = Task.new(-1, name, list_id)
    task.save
    task
  end

  def name
    @name
  end

  def list_id
    @list_id
  end


  def self.all

    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each do |result|
      id = result['id'].to_i
      name = result['name']
      list_id = result['list_id'].to_i
      tasks << Task.new(id, name, list_id)
    end
    puts tasks
    tasks
  end

  def self.get_list_tasks(id)
    results = DB.exec("SELECT * FROM tasks WHERE list_id = #{id}")
    tasks = []
    tasks.each do |task|
      id = task['id'].to_i
      name = task['name']
      list_id = task['list_id'].to_i
      tasks << Task.new(id, name, list_id)
    end
    tasks
  end

  def save
    results = DB.exec("INSERT INTO tasks (name, list_id) values ('#{@name}', #{@list_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_task)
    self.name == another_task.name && self.list_id == another_task.list_id
  end

end
