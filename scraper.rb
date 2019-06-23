require 'open-uri'
require 'nokogiri'
require 'yaml'

# ingredient = 'chocolate'
url = 'https://www.staseraintv.com/index.html'
# def scrapeit(url)
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# TITLE SCRAPER
html_doc.search('.listingprevbox').each do |element|
  @ch_title = []
  @ch_title << element.text.strip.split("\n").first


# CONTENT SCRAPER
html_doc.search('.listingprevbox p').each do |element|
  @ch_progs = element.text.strip.split("\n")

  progs = {
    title: @ch_title,
    programs: @ch_progs
  }
  p progs
end
end
# end

# scrapeit(url)

# puts "writing into db"
# File.open("progs.yml", "w") do |f|
#   f.write(progs.to_yaml)
# end
# puts "done, dude!"
