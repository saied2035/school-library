require './teacher'
require './student'
require 'json'
# Store people in json file
class PeopleStore
  attr_reader :people_list

  def initialize
    @people_list = []
  end

  def load_people
    File.exist?('./people.json') && set_people
    File.write('people.json', '{"people":[]}') unless File.exist?('./people.json')
    @people_list
  end

  def add_student(age, name, parent_permission)
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people_list.push({ value: student, type: 'Student' })
  end

  def add_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name)
    @people_list.push({ value: teacher, type: 'Teacher' })
  end

  def store_people
    file = File.read('./people.json')
    parsed_json = JSON.parse(file)
    @people_list.length != parsed_json['people'].length && @people_list.length.positive? &&
      people_to_json(parsed_json)
  end

  private

  def set_people
    people = JSON.parse(File.read('./people.json'))['people']
    people.each do |person|
      value = person['value']
      type = person['type']
      type == 'Student' && add_student(value['age'], value['name'], value['parent_permission'])
      type == 'Teacher' && add_teacher(value['age'], value['name'], value['specialization'])
    end
    edit_ids
  end

  def people_to_json(parsed_json)
    edit = []
    @people_list.each do |person|
      edit = parsed_json['people'].push(
        { 'type' => person[:type],
          'value' => { 'name' => person[:value].name, 'id' => person[:value].id.to_s,
                       'age' => person[:value].age.to_s } }
      )
    end
    File.write('./people.json', JSON.pretty_generate({ people: edit }))
  end

  def edit_ids
    file = File.read('./people.json')
    parsed_json = JSON.parse(file)

    @people_list.each_with_index do |person, i|
      parsed_json['people'][i]['value']['id'] = person[:value].id.to_s
    end
    File.write('./people.json', JSON.pretty_generate(parsed_json))
  end
end
