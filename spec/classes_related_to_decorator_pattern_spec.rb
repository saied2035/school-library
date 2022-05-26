require_relative '../nameable'
require_relative '../decorator'
require_relative '../capitalizedecorator'
require_relative '../trimmerdecorator'
require_relative '../person'
describe Nameable do
  it 'test nameable interface' do
    nameable = Nameable.new
    expect(nameable).to be_instance_of(Nameable)
  end
end

describe Decorator do
  it 'test Decorator creation' do
    decorator = Decorator.new
    expect(decorator).to be_kind_of(Nameable)
    expect(decorator.nameable).to be_instance_of(Nameable)
    expect(decorator.nameable).to_not be_instance_of(Decorator)
  end
end

describe CapitalizeDecorator do
  it 'test CapitalizeDecorator creation' do
    capitalize_decorator = CapitalizeDecorator.new
    expect(capitalize_decorator).to be_instance_of(CapitalizeDecorator)
    expect(capitalize_decorator).to be_kind_of(Decorator)
    expect(capitalize_decorator).to be_kind_of(Nameable)
  end
end

describe TrimmerDecorator do
  it 'test TrimmerDecorator creation' do
    trimmer_decorator = TrimmerDecorator.new
    expect(trimmer_decorator).to be_instance_of(TrimmerDecorator)
    expect(trimmer_decorator).to be_kind_of(Decorator)
    expect(trimmer_decorator).to be_kind_of(Nameable)
  end
end

describe 'correct name' do
  it 'test correct name method capitialize' do
    person = Person.new(24, 'saied', parent_permission: true)
    capitalize_decorator = CapitalizeDecorator.new(person)
    expect(capitalize_decorator.correct_name).to eq 'Saied'
  end

  it 'test correct name method trim' do
    person = Person.new(24, 'saiedsaiedabc', parent_permission: true)
    trimmer_decorator = TrimmerDecorator.new(person)
    expect(trimmer_decorator.correct_name).to eq 'saiedsaied'
  end

  it 'test correct name method capitialize & trim' do
    person = Person.new(24, 'saiedsaiedabc', parent_permission: true)
    capitalize_decorator = CapitalizeDecorator.new(person)
    trimmer_decorator = TrimmerDecorator.new(capitalize_decorator)
    expect(trimmer_decorator.correct_name).to eq 'Saiedsaied'
  end
end
