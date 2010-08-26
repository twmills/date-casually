require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "date-casually"
    gem.summary = %Q{Easy on the eyes alternative to the Rails distance_of_time_in_words_to_now helper method.}
    gem.description = %Q{If you've never liked (and always seem to forget) the name of the Rails distance_of_time_in_words_to_now helper method, then it's time to date casually.}
    gem.email = "twmills@twmills.com"
    gem.homepage = "http://github.com/twmills/date-casually"
    gem.authors = ["Theo Mills"]
    gem.add_dependency 'i18n', ">= 0.4.1"    
    gem.add_development_dependency "timecop", ">= 0.3.5"
    gem.add_development_dependency "chronic", ">= 0.2.3"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "date-casually #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end