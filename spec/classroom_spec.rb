require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('English')
  end

  it 'test classroom creation' do
    expect(@classroom).to be_instance_of(Classroom)
    expect(@classroom.label).to eq 'English'
  end

  it 'test add student method' do
    student = Student.new(24, nil, 'saied', parent_permission: true)
    @classroom.add_student(student)
    expect(@classroom.student_array.length).to eq 1
  end

  it 'test fail to add student' do
    @classroom.add_student('student')
    expect(@classroom.student_array.length).to eq 0
  end
end
