require 'spec_helper'

describe List do
  it 'is initialized with a name' do
    list = List.new('feed the cat')
    list.should be_an_instance_of List
  end

  it 'tells you its name' do
    list = List.new('Feed Kitty')
    list.name.should eq 'Feed Kitty'
  end

  it 'is the name list if it has the same name' do
    list1 = List.new('Elvis Lives')
    list2 = List.new('Elvis Lives')
    list1.should eq list2
  end

  it 'starts off with no lists' do
    List.all.should eq []
  end

  it 'lets you save lists to the database' do
    list = List.new('Elvis stuff')
    list.save
    List.all.should eq [list]
  end

  describe ".select" do
    it 'return name after .create method' do
      list = List.create('Laundry')
      List.select('Laundry').should eq 'Laundry'
    end
  end

end
