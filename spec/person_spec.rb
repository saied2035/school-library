require_relative '../people_store'
require_relative '../student'
require_relative '../teacher'

describe 'People Add and List' do
  context 'Checking data before at instant' do
    it 'it should be instance of array' do
      people = PeopleStore.new.people_list
      result = people.is_a? Array
      expect(result).to be_truthy
    end

    it 'It should add student data' do
      people = PeopleStore.new
      people.add_student(34, 'bushra', 'Y')
      people_list = people.people_list
      expect(people_list.length).to eq 1
    end

    it 'It should add teacher data' do
      people = PeopleStore.new
      people.add_teacher(666, 'Saied', 'Programming')
      len = people.people_list.length
      expect(len).to equal 1
    end
  end
end

describe PeopleStore do
  before(:each) do
    @people_obj = PeopleStore.new
    @people_obj.add_student(33, 'Adam', 'Y')
    @people_obj.add_teacher(777, 'Alex', 'CR')
  end
  context 'Giving data before initial and check it contains' do
    it 'It should contain student property on people list obj' do
      data = @people_obj.people_list
      expect(data.length).to equal 2
    end
  end
end
