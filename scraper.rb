require 'open-uri'
require 'nokogiri'
require 'yaml'

# ingredient = 'chocolate'
url = 'https://www.staseraintv.com/index.html'
# def scrapeit(url)
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# TITLE SCRAPER
array_channels = []
html_doc.search('.listingprevbox').each do |element|
   hash_channel = {}
   title = element.text.strip.split("\n").first

   element.search("p").each do |p_element|
      hash_channel.store(title,p_element.text.strip.split("\n"))
   end
  # @ch_title = []
  # @ch_title << element.text.strip.split("\n").first
  # p @ch_title
  array_channels << hash_channel
end
p array_channels
# CONTENT SCRAPER
# html_doc.search('.listingprevbox p').each do |element|
#   @ch_progs = element.text.strip.split("\n")
#   p @ch_progs
# end
File.open("progs.yml", "w") { |file| file.write(array_channels.to_yaml) }
