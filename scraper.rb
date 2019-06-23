require 'open-uri'
require 'nokogiri'
require 'yaml'

ingredient = 'chocolate'
url = "https://www.staseraintv.com/index.html"


html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


  html_doc.search('.listingprevbox').each do |element|
   # puts element.text.strip
    ch_title = []
    ch_title << element.text.strip.split("\n").first
    p ch_title.first
  end


# html_doc.search('.listingprevbox p').each do |element|
#   puts element.text.strip
#   @ch_prog = element.text.strip
#   # puts element.text.strip
#   # puts element.attribute('href').value
# end

  # {
  #   title: @ch_title,
  #   programs: @ch_prog
  # }

# puts "writing into db"
# File.open("progs.yml", "w") do |f|
#   f.write(@progs.to_yaml)
# end
# puts "done, dude!"
