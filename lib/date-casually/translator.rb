module DateCasually
  
  # The Translator class is the core of the date-casually functionality,
  # translating the supplied date to its casual equivalent. 
  class Translator
    
    # The possible options and order of the :as toggle
    AS_OPTIONS = [:days, :day_of_week, :weeks, :months, :years]
    
    # 
    # This method takes the supplied date and determines how it should be translated 
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
      
      # Process in order until we hit a condition that matches
      # the supplied date.
      translator = nil
      self.as_options(options).each do |option|
          translator = self.get_translator(option)
          translation = translator.translate(date)
          return translation unless translation.nil?
      end              
      
      # If no conditions are caught, use our last :as option to create
      # explicit counts. I.e. 470 days ago, 46 months from now, 4 years from now, etc.
      unless translator.nil?
        translation = translator.translate_count(date)      
        return translation unless translation.nil?
      end
      
      raise "[date-casually] No ruleset defined for this date: #{date}"
    end
    
    # 
    # Process :as option if passed, otherwise use global config
    def self.as_options(options)
      as = []
      as << (!options.nil? && options.has_key?(:as) ? options[:as] : DateCasually::Config.as)
      self::AS_OPTIONS & as.flatten
    end
    
    def self.get_translator(sym)
      DateCasually::Translators.const_get(self.camelcase(sym.to_s))
    end
    
    def self.camelcase(string)
      string.downcase.gsub(/\b[a-z]|_+[a-z]/) { |a| a.upcase }.gsub(/\s|_/,'')
    end
        
  end
end