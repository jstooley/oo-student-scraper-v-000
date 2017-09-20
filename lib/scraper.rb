require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_index_array = []
    doc = Nokogiri::HTML (open(index_url))
    doc.css(".student-card").each_with_index do |post, i|
      student_index_array[i] = {
      :name => post.css(".student-name").text,
      :location => post.css(".student-location").text,
      :profile_url => post.css("a")[0]['href']}
    end
    student_index_array
  end

  def self.scrape_profile_page(profile_url)
    profile_index_array = []
    
    doc = Nokogiri::HTML (open(index_url))
  

      links = post.css(".social-icon-container a").collect{|line| line.attr('href')}
      links.each do |link|
         when link.include?("twitter")
             profile_index_array[:twitter] = link
         when link.include?("linkedin")
              profile_index_array[:linkedin] = link
          when link.include?("github")
              profile_index_array[:github] = link
          else
              profile_index_array[:blog] = link
        end
      end # all links end
      profile_index_array[i]= {
      :profile_quote =>post.css(".profile_quote").text,
      :bio =>post.css(".description-holder p").text}
    end
    profile_index_array
    binding.pry
  end

end
