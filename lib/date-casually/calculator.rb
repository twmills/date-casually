module DateCasually
  
  # Contains convenience calculations for determing the distance between
  # today and a supplied date. All methods are module methods and should be called
  # on the Calculator module. 
  # For example:
  #
  #   DateCasually::Calculator.number_of_weeks_from_today(Date.today + 28)
  #   #=> 4
  #
  module Calculator
    
    # Returns the number of full weeks from the supplied date to today's date.
    #
    # date  - The Date used to compare against today's date and determine the number
    #         of weeks between the two.
    #
    # Examples (if today is 2010-09-03)
    #
    #   DateCasually::Calculator.number_of_weeks_from_today(Date.today + 28)
    #   #=> 4
    #  
    #   DateCasually::Calculator.number_of_weeks_from_today(Date.today)
    #   #=> 0
    #
    # Returns the number of weeks between the supplied date and today.
    def self.number_of_weeks_from_today(date)
      ((Date.today - date) / 7).to_i.abs
    end
    
    # Returns the number of months from to today's date to the supplied date. 
    #
    # date  - The Date used to compare against today's date and determine the number
    #         of months between the two.
    #
    # Examples (if today is 2010-09-03)
    #
    #   DateCasually::Calculator.number_of_months_from_today(Date.today + 28)
    #   #=> 1
    #  
    # Returns the number of months between the supplied date and today.
    def self.number_of_months_from_today(date)
      ((Date.today.month - date.month) + 12 * (Date.today.year - date.year)).abs      
    end
    
    # Returns the number of years from to today's date to the supplied date. 
    #
    # date  - The Date used to compare against today's date and determine the number
    #         of years between the two.
    #
    # Examples (if today is 2010-09-03)
    #
    #   DateCasually::Calculator.number_of_months_from_today(Date.today + 365)
    #   #=> 1
    #  
    # Returns the number of years between the supplied date and today.
    def self.number_of_years_from_today(date)
      years_diff = (Date.today.year - date.year).abs
    end
    
    # Returns a range of dates for the current week. Starts with Sunday and ends 
    # on Saturday.
    #
    # Examples (if today is 2010-09-03)
    #
    #   DateCasually::Calculator.this_week_range.to_s #to_s used for clarity
    #   #=> "2010-08-29..2010-09-04"
    #  
    # Returns a range of dates for the current week.
    def self.this_week_range
      self.this_past_sunday..(self.this_past_sunday + 6)
    end
    
    # Returns a range of dates for the coming week. Starts with Sunday and ends 
    # on Saturday.
    #
    # Examples (if today is 2010-09-03)
    #   
    #   DateCasually::Calculator.next_week_range.to_s #to_s used for clarity
    #   #=> "2010-09-05..2010-09-11"
    #  
    # Returns a range of dates for the coming week.
    def self.next_week_range
      self.next_sunday..(self.next_sunday + 6)
    end
    
    # Returns a range of dates for the previous week. Starts with Sunday and ends 
    # on Saturday.
    #
    # Examples (if today is 2010-09-03)
    #   
    #   DateCasually::Calculator.last_week_range.to_s #to_s used for clarity
    #   #=> "2010-08-22..2010-08-28"
    #  
    # Returns a range of dates for the previous week.
    def self.last_week_range
      self.last_sunday..(self.last_sunday + 6)
    end
    
    # Returns a range of dates for the coming week. Starts with Sunday and ends 
    # on Saturday.
    #
    # Examples (if today is 2010-09-03)
    #   
    #   DateCasually::Calculator.next_week_range.to_s #to_s used for clarity
    #   #=> "2010-09-05..2010-09-11"
    #  
    # Returns a range of dates for the coming week.
    def self.next_sunday
      date = Date.today
      (date.wday == 0) ? (date += 7) : (date += 1 until (date.wday == 0))
      date
    end
    
    # Returns the date of last week's Sunday.
    #
    # Examples (if today is 2010-09-03)
    #   
    #   DateCasually::Calculator.last_sunday.to_s #to_s used for clarity
    #   #=> "2010-08-22"
    #  
    # Returns the Date of last week's Sunday.
    def self.last_sunday
      self.this_past_sunday - 7
    end
    
    # Returns the date of the most recent Sunday in the past.
    #
    # Examples (if today is 2010-09-03)
    #   
    #   DateCasually::Calculator.this_past_sunday.to_s #to_s used for clarity
    #   #=> "2010-08-29"
    #  
    # Returns the Date of the most recent Sunday in the past.
    def self.this_past_sunday
      date = Date.today
      (date.wday == 0) ? date : (date -= 1 until (date.wday == 0)) 
      date
    end
    
  end  
end