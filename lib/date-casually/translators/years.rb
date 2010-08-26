module DateCasually
  module Translators  
    class Years    

      # Scopes for translation into years
      def self.translate(date)
        today = Date.today
        case
        when DateCasually::Calculator.number_of_months_from_today(date) < 12
          if (date.year - today.year).abs == 1
            key = today < date ? 'date.casual.next_year' : 'date.casual.last_year'
          else
            key = today < date ? 'date.casual.less_than_a_year_from_now' : 'date.casual.less_than_a_year_ago'
          end
          I18n.t(key)      
        when (date.year - today.year).abs == 1
          key = today < date ? 'date.casual.next_year' : 'date.casual.last_year'    
          I18n.t(key)      
        when DateCasually::Calculator.number_of_months_from_today(date) <= 30
          key = today < date ? 'date.casual.couple_of_years_from_now' : 'date.casual.couple_of_years_ago'
          I18n.t(key)
        else 
          nil
        end      
      end
        
      # Translates into number of weeks away, e.g. "6 years ago"
      def self.translate_count(date)
        key = Date.today < date ? 'date.casual.years_from_now' : 'date.casual.years_ago'
        I18n.t(key, :number => DateCasually::Calculator.number_of_years_from_today(date))
      end
    
    end
  end
end