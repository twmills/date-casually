module DateCasually  
  
  # Contains global configuration options for DateCasually. These options 
  # may be changed globally at runtime by using the designated class method. 
  # For example:
  #
  #   DateCasually::Config.as :years
  #   (Date.today + 2).casual
  #   #=> "less than a year from now"
  #
  module Config
    
    class << self
      
      # Gets and sets a map that tells DateCasually which translation options to use 
      # when translating the current date. Values should be passed as an array of symbols.
      # Possible values are :day, :week, :month, :year, :day_of_week. 
      #
      # Examples:
      #
      #   date = Date.new(2010, 8, 30)
      #
      #   (date + 6).casual(:day_of_week)
      #   #=> 'next week'
      #
      #   (date + 1).casual(:months) 
      #   #=> 'less than a month from now'
      #
      #   (date + 660).casual(:months)
      #   #=> '21 months from now'
      #
      #   (date + 660).casual(:months, :years)
      #   #=> 'a couple of years from now'      
      #
      attr_accessor :as
    end
    
    # Resets the classes configuration options back to their defaults. Used
    # primarily to reset the class configuration options when the module 
    # gets loaded.
    #
    # Example:
    #
    #   self.reset
    #
    # Returns nothing.
    def self.reset
      self.as = [:days, :weeks, :months, :years]
    end
    
    # Reset the first time we are loaded.
    self.reset
    
  end
end