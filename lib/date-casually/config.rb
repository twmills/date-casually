module DateCasually  
  class Config
    class << self
      attr_accessor :as
    end
    
    def self.reset
      self.as = [:days, :weeks, :months, :years]
    end
    
    #reset the first time we are loaded.
    self.reset
  end
end