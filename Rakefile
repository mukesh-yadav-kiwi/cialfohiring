require 'rubygems'
require 'json'
require_relative './parse_page'


task :scraping do
  puts "Scraping started"

  element_array = ParsePage.new.to_json

  puts "Scraping finished"

  File.open("output.json","w") do |f|
    f.write(element_array.to_json)
  end

end


