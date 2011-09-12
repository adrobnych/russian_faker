# encoding: utf-8
require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerName < Test::Unit::TestCase

  def setup
    @tester = Faker::Name
  end
  
  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
    
    russian_name = @tester.russian_name
    
    p "*********************************"
    p russian_name
    p "*********************************"
    
    assert russian_name.match(/([а-яА-Я]+\.? ?){2,3}/)
  end
  
  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end
  
  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end
end
