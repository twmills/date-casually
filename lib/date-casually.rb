$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'date'
require 'i18n'
require "date-casually/config"
require "date-casually/calculator"
require "date-casually/translator"
require "date-casually/translators/days"
require "date-casually/translators/weeks"
require "date-casually/translators/months"
require "date-casually/translators/day_of_week"
require "date-casually/translators/years"
require "extensions/date"

# load up translations
I18n.load_path << Dir[File.join(File.dirname(__FILE__), 'locale', '*.{rb,yml}')]