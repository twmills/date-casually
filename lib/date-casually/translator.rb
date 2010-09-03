module DateCasually
  
  # The core of the date-casually functionality, translating the supplied date to 
  # its casual equivalent. This module is primarily intended to be used from the
  # DateCasually Date extension class. All methods are module methods and should be called
  # on the Translator module. 
  # For example:
  #
  #   DateCasually::Translator.number_of_weeks_from_today(Date.today + 28)
  #   #=> 4
  #  
  module Translator
    
    # The possible options and order of the :as toggle
    AS_OPTIONS = [:days, :day_of_week, :weeks, :months, :years]
    
    # Public: Takes the supplied date and determines how it should be translated 
    # into its casual equivalent. If the :as option is passed with a valid value,
    # then the date is evaluated against that scope, e.g. :as=>:day_of_week.
    # Otherwise, the Translator iterates through all the available scopes until a
    # match on the supplied date is made.
    #
    # Though it's easier to use date-casually date extension and monkey-patch
    # this function into the Date class, it's also possible to call the casual
    # function directly.
    #
    def self.casual(date, options = {})
      
      # Loop through the :as options and try to translate the date
      # for the given options.
      translator = nil
      self.as_options(options).each do |option|
          translator = self.get_module(option)
          translation = translator.translate(date)
          return translation unless translation.nil?
      end              
      
      # If no translations are found, use our last translator to create
      # explicit counts. I.e. 470 days ago, 46 months from now, 4 years from now, etc.
      unless translator.nil?
        translation = translator.translate_count(date)      
        return translation unless translation.nil?
      end
      
      # This should never be encountered. If it is, we've got a bug and want to
      # be vocal about it.
      raise "[date-casually] No ruleset defined for this date: #{date}"
    end
    
    # Determines which :as options to use during translation. If no :as option is passed
    # at runtime, use the definition in the Config module. Since the :as values must occur
    # in a chronological order (e.g. :days, :weeks, :months), this method ensures the values
    # are correctly ordered before returning them. It also parses out any values that aren't
    # found in the AS_OPTIONS constant.
    #
    # options - Hashmap of DateCasually options. 
    # 
    # Example:
    #   options[:as] = :weeks, :days, :years, :months, :foobar
    #   DateCasually::Translator.as_options(options)
    #   # => :days, :weeks, :days, :months, :years
    #
    # Returns Array of :as configuration options, sorted like the AS_OPTIONS array.
    def self.as_options(options)
      as = []
      as << (!options.nil? && options.has_key?(:as) ? options[:as] : DateCasually::Config.as)
      self::AS_OPTIONS & as.flatten
    end
    
    # Dynamically returns the translator module that corresponds to the 
    # supplied symbol. The symbol should correspond to one of those found
    # in the AS_OPTIONS array, though this is not enforced.
    #
    # sym - Symbol that corresponds to the supplied symbol. 
    # 
    # Example:
    #   DateCasually::Translator.get_module(:days)
    #   # => Days
    #
    # Returns Module that corresponds to the supplied symbol
    def self.get_module(sym)
      const_get(self.camelcase(sym.to_s))
    end
    
    # Converts a string to the camel case format, removing any underscores and upcasing
    # the character that immediately follow them.
    #
    # string - String to be converted to camel case. 
    # 
    # Example:
    #   DateCasually::Translator.camelcase("day_of_week")
    #   # => "DayOfWeek"
    #
    # Returns String in the camelcase format
    def self.camelcase(string)
      string.downcase.gsub(/\b[a-z]|_+[a-z]/) { |a| a.upcase }.gsub(/\s|_/,'')
    end
        
  end
end