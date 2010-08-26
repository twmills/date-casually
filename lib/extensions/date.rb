class Date
  def casual(options = {})
    DateCasually::Translator.casual(self, options)
  end  
end