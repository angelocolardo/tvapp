require 'open-uri'
require 'nokogiri'
require 'yaml'

rai1 = "https://www.staseraintv.com/programmi_stasera_rai1.html"
rai2 = "https://www.staseraintv.com/programmi_stasera_rai2.html"
rai3 = "https://www.staseraintv.com/programmi_stasera_rai3.html"
rai4 = "https://www.staseraintv.com/programmi_stasera_rai4.html"
rai5 = "https://www.staseraintv.com/programmi_stasera_rai5.html"
raimovie = "https://www.staseraintv.com/programmi_stasera_raimovie.html"


channels = [rai1, rai2, rai3, rai4, rai5, raimovie]

#url = 'https://www.staseraintv.com/index.html'
@array_channels = []
def scrapeit(url)
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# TITLE SCRAPER
html_doc.search('.listingbox').each do |element|
   hash_channel = {}
   title = element.search("h1").text

   element.search("h4").each do |p_element|
      hash_channel.store(title,p_element.text.strip.split(/(?<=[a-zA-Z])(?=[0-9])/))
   end

  @array_channels << hash_channel
end
end

channels.map do |url|
  puts "Scraping #{url}"
  scrapeit(url)
end

p "writing into DB"
File.open("progs_complete.yml", "w") { |file| file.write(@array_channels.to_yaml) }
p "done, dude!"
