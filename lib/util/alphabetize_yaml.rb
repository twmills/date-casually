require 'yaml'
class Hash
  def to_sorted_yaml( opts = {} )
    YAML::quick_emit( object_id, opts ) do |out|
      out.map( taguri, to_yaml_style ) do |map|
        sort.each do |k, v| 
          map.add(k,v)
          if v.is_a? Hash
            v.sort.each do |x,y|
              if y.is_a? Hash
                y.sort.each do |u,t|
                  map.add(u,t)
                end
              end

            end
          end
        end
      end
    end
  end
  
end
files = Dir.glob(File.join(File.dirname(__FILE__),"*.yml"))

files.each do |file|
  hash = YAML::load(File.read(file))
  def alphabetize(hash, tabs = 0)
    string=""
    hash.keys.sort.each do |key| 
      tabs.times { string << " " }
      string << (hash[key].is_a?(Hash) ? ("#{key}: \n" + alphabetize(hash[key], tabs + 2)) : "#{key}: #{hash[key]}\n")
    end
    string
  end
  File.open(file + '.sorted', 'w') { |f| f.write(alphabetize(hash)) }
end

