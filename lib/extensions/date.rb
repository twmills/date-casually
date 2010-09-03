# The Date class gets monkey-patched (gasp!) to activate DateCasually features
# via the 'casual' method. 
class Date
  
  # Public: Translates the current date object (self) into its language-based
  # equivalent.
  #
  # options  - List of options to control what the casual method outputs.
  #            :as - Tells DateCasually which date ranges to use when translating 
  #                  the current date. Values should be passed an array of symbols.
  #                  Possible values are :day, :week, :month, :year, :day_of_week.
  #
  # Examples
  #   date = Date.new(2010, 8, 30)
  #
  #   (date + 1).casual
  #   #=> 'tomorrow'
  #  
  #   (date - 1).casual
  #   #=> 'yesterday'
  #
  #   (date + 6).casual
  #   #=> 'next week'
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
  # Returns language translation of the current date.
  def casual(options = {})
    DateCasually::Translator.casual(self, options)
  end  
end