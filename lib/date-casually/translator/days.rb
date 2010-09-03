module DateCasually
  module Translator
    module Days    
    
      # Scopes for translation into days
      def self.translate(date)
        today = Date.today
        case
        when date == today then I18n.t('date.casual.today')
        when date == today + 1 then I18n.t('date.casual.tomorrow')
        when date == (today - 1) then I18n.t('date.casual.yesterday')
        when date == (today + 2) then I18n.t('date.casual.couple_of_days_from_now')
        when date == (today - 2) then I18n.t('date.casual.couple_of_days_ago')
        else nil
        end
      end
    
      # Translates into number of days away, e.g. "6 days ago"
      def self.translate_count(date)
        i18n_key = (date < Date.today) ? 'ago' : 'from_now'
        I18n.t("date.casual.days_#{i18n_key}", :number => (date - Date.today).abs) 
      end
    
    end
  end
end