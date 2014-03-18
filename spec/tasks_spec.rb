require 'spec_helper'

describe Task do
  it 'is initialized with a name and a task ID' do
    task = Task.new('feed the dog', 1)
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('Feed Harper', 1)
    task.name.should eq 'Feed Harper'
  end

  it 'tells you its list ID' do
    task = Task.new('Feed Harper', 1)
    task.list_id.should eq 1
  end

  it 'starts wil no tasks' do
    Task.all.should eq []
  end

  it 'lets you sav tasks to the database' do
    task = Task.new('Feed Harper', 1)
    task.save
    Task.all.should eq [task]
  end

  it 'is the same task if it has the same name' do
    task1 = Task.new('Feed Harper', 1)
    task2 = Task.new('Feed Harper', 1)
    task1.should eq task2
  end

  it 'saves' do
    list = List.new('Epic')
    list.save
    list.id.should be_an_instance_of Fixnum
  end
  describe '.create' do
    it 'create task' do
      task = Task.create('BArtar', 1)
      puts Task.all[0].name
      Task.all[0].name should eql 'BArtar'
    end
  end
end
