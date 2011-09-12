# encoding: utf-8

require "unicode"

module Faker
  class Internet
    class << self
      def email(name = nil)
        [ user_name(name), domain_name ].join('@')
      end
     
      def russian_email(name = nil)
	[ russian_user_name(name), russian_domain_name ].join('@')
      end
      
      def free_email(name = nil)
        [ user_name(name), %w(gmail.com yahoo.com hotmail.com).rand ].join('@')
      end
      
      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
        
        [ 
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new { 
            [ Name.first_name, Name.last_name ].map {|n| 
              n.gsub(/\W/, '')
            }.join(%w(. _).rand).downcase }
        ].rand.call
      end
      
      def russian_user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
        
        [ 
          Proc.new { Unicode::downcase(Name.russian_male_first_name.gsub(/\^[а-яА-Я]/, '')) },
          Proc.new { 
            Unicode::downcase( 
	      [ Name.russian_male_first_name, Name.russian_male_last_name ].map {|n| 
              n.gsub(/\^[а-яА-Я]/, '')
            }.join(%w(. _).rand)) },
	  Proc.new { Unicode::downcase(Name.russian_female_first_name.gsub(/\^[а-яА-Я]/, '')) },
          Proc.new { 
            Unicode::downcase( 
	      [ Name.russian_female_first_name, Name.russian_female_last_name ].map {|n| 
              n.gsub(/\^[а-яА-Я]/, '')
            }.join(%w(. _).rand)) }
        ].rand.call
      end
      
      def domain_name
        [ domain_word, domain_suffix ].join('.')
      end
      
      def russian_domain_name
        [ russian_domain_word, russian_domain_suffix ].join('.')
      end
      
      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end
      
      def russian_domain_word
        Unicode::downcase(Company.russian_name.gsub(/\^[а-яА-Я]|\s/, ''))
      end
      
      def domain_suffix
        %w(co.uk com us uk ca biz info name).rand
      end
      
      def russian_domain_suffix
        %w(рф ком.рф).rand
      end
      
    end
  end
end