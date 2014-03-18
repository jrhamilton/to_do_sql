require 'pg'
require './lib/tasks'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def welcome
  puts "Haowloooo, welcome to our tribe!"
  puts "Are you ready to create some tasks?"
  puts "Enter 'Yes' to continue, 'X' to exit"
  choice = gets.chomp
  case choice
    when 'x', 'X'
      puts "harw! harw! harw!"
      welcome
  else
    menu
  end
end

def menu
  puts "Press 'A': Add new list"
  puts "Press 'L': Show all lists"
  choice = gets.downcase.chomp
  case choice
    when "a"
      add_list
    when "l"
      list_all
  else
    puts "Hrey! prarss 'Ar' or 'Lr' arkay?r?r?r sturpid ar tar!!!"
    menu
  end
end

def add_list
  puts "Nrame your larst"
  name = gets.chomp
  list = List.create(name)
  #puts "#{name} has been create as List"
  puts "#{List.select(name)} hars barn antarred intor yar darta"
  menu
end

def list_all
  List.all.each_with_index do |list, index|
    puts "#{list.id}: #{list.name}"
  end

  puts "Park ar larst nerber"
  list_number = gets.chomp.to_i
  Task.get_list_tasks(list_number).each do |task|
    puts "#{task.name}"
  end

  puts "Press 'A' to add new task"
  puts "Press 'M' for menu"
  task_choice = gets.upcase.chomp
  case task_choice
    when 'A'
      add_task(list_number)
    when 'M'
      menu
    else
      puts "Irvarard erntra"
      menu
  end
end

def add_task(list_number)
  puts "Wrat ar yar tarsk"
  choice = gets.chomp
  Task.create(choice, list_number)
  list_all
end
welcome
