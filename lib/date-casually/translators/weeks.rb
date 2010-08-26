module DateCasually
  module Translators  
    class Weeks    

        # Scopes for translation into weeks
        def self.translate(date)
          today = Date.today
          case
          when DateCasually::Calculator.this_week_range.include?(date)
            key = today < date ? 'date.casual.less_than_a_week_from_now' : 'date.casual.less_than_a_week_ago'
            I18n.t(key)
          when DateCasually::Calculator.last_week_range.include?(date)
            I18n.t('date.casual.last_week')
          when DateCasually::Calculator.next_week_range.include?(date)
            I18n.t('date.casual.next_week')
          when (today - date).abs < 21
            key = today < date ? 'date.casual.couple_of_weeks_from_now' : 'date.casual.couple_of_weeks_ago'
            I18n.t(key)      
          else
            nil
          end
        end
      
        # Translates into number of weeks away, e.g. "6 weeks ago"
        def self.translate_count(date)
          key = Date.today < date ? 'date.casual.weeks_from_now' : 'date.casual.weeks_ago'
          I18n.t(key, :number => DateCasually::Calculator.number_of_weeks_from_today(date))      
        end
    
    end
  end
end