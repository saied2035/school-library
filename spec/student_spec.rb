require_relative '../student'

describe Student do
  before(:each) do
    @stud = Student.new(33, 'CR', true)
  end
  context 'Calling methods under student class' do
    it 'calling play_hooky should return ¯\(ツ)/¯' do
      expect(@stud.play_hooky).to eq "¯\(ツ)/¯"
    end

    it 'add_classroom method should return not null' do
      msg = @stud.add_classroom('grade-4')
      expect(msg).to be_nil
    end
  end
end
