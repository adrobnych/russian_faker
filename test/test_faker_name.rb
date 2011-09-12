# encoding: utf-8
require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerName < Test::Unit::TestCase

  def setup
    @tester = Faker::Name
  end
  
  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
    
    russian_name = nil
    50.times do
      russian_name = @tester.russian_name
      p russian_name
    end
    
    assert russian_name.match(/([а-яА-Я]+\.? ?){2,3}/)
  end
  
  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end
  
  def test_russian_prefix
    russian_prefix = @tester.russian_prefix
    assert russian_prefix.match(/[А-Яа-я]+\.?/)
  end
  
  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end
  
  def test_russian_suffix
    assert @tester.russian_suffix.match(/[А-Яа-я]*\.?/)
  end
end
