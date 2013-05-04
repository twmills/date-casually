$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'date'
require 'i18n'

require "date-casually/config"
require "date-casually/calculator"
require "date-casually/translator"
require "date-casually/translator/days"
require "date-casually/translator/weeks"
require "date-casually/translator/months"
require "date-casually/translator/day_of_week"
require "date-casually/translator/years"
require "extensions/date"

# load up translations
I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locale', '*.{rb,yml}')]