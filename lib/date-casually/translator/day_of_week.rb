module DateCasually
  module Translator 
    module DayOfWeek    
    
      # Scopes for translation into day of week
      def self.translate(date)
        today = Date.today
        case
        when date == today then I18n.t('date.casual.today')
        when (date - today).abs <= 3
          key = today < date ? "date.casual.this_wday_#{date.wday}" : "date.casual.this_past_wday_#{date.wday}"
          I18n.t(key)
        when DateCasually::Calculator.last_week_range.include?(date)
          I18n.t("date.casual.last_wday_#{date.wday}")
        when DateCasually::Calculator.next_week_range.include?(date)
          I18n.t("date.casual.next_wday_#{date.wday}")
        else
          nil
        end
      end
    
      # Translates into number of days of weeks away, e.g. "6 Mondays ago"
      def self.translate_count(date)
        key = Date.today < date ? "date.casual.wdays_from_now_#{date.wday}" : "date.casual.wdays_ago_#{date.wday}"
        I18n.t(key, :number => DateCasually::Calculator.number_of_weeks_from_today(date))      
      end
    
    end
  end
end