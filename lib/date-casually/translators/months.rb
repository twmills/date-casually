module DateCasually
  module Translators
  
    class Months    
      
      # Scopes for translation into months
      def self.translate(date)
        today = Date.today
        case
        when (today - date).abs <= 29
          key = today < date ? 'date.casual.less_than_a_month_from_now' : 'date.casual.less_than_a_month_ago'
          I18n.t(key)            
        when (30..60).include?((today - date).abs)
          key = today < date ? 'date.casual.next_month' : 'date.casual.last_month'
          I18n.t(key)
        when DateCasually::Calculator.number_of_months_from_today(date) == 2
          key = today < date ? 'date.casual.couple_of_months_from_now' : 'date.casual.couple_of_months_ago'
          I18n.t(key)
        else
          nil
        end
      end
    
      # Translates into number of months away, e.g. "6 months ago"
      def self.translate_count(date)
        key = Date.today < date ? 'date.casual.months_from_now' : 'date.casual.months_ago'
        date = I18n.t(key, :number => DateCasually::Calculator.number_of_months_from_today(date))
      end    
    
    end
  end
end