require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(88, 'math', 'CR')
  end
  context 'Checking class instance' do
    it 'Should return age equal to 88' do
      age = @teacher.age
      puts "#{@teacher.age} checking..."
      expect(age).to eq 88
    end
    it 'calling can_use_services should return true' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end
end
