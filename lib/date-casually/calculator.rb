module DateCasually
  
  # Contains short-cut calculations for determing the distance between
  # today and a supplied date.
  class Calculator

    def self.number_of_weeks_from_today(date)
      ((Date.today - date) / 7).to_i.abs
    end
    
    def self.number_of_months_from_today(date)
      ((Date.today.month - date.month) + 12 * (Date.today.year - date.year)).abs      
    end
    
    def self.number_of_years_from_today(date)
      years_diff = (Date.today.year - date.year).abs
    end
    
    def self.this_week_range
      self.this_past_sunday..(self.this_past_sunday + 6)
    end
    
    def self.next_week_range
      self.next_sunday..(self.next_sunday + 6)
    end

    def self.last_week_range
      self.last_sunday..(self.last_sunday + 6)
    end
    
    def self.next_sunday
      date = Date.today
      (date.wday == 0) ? (date += 7) : (date += 1 until (date.wday == 0))
      date
    end
    
    def self.last_sunday
      self.this_past_sunday - 7
    end
    
    def self.this_past_sunday
      date = Date.today
      (date.wday == 0) ? date : (date -= 1 until (date.wday == 0)) 
      date
    end
    
  end  
end