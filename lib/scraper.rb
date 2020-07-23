require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
      doc = Nokogiri::HTML(open("https://defirate.com/lend/"))
  end

def get_courses
     self.get_page.css(".rate-cell")
end


def make_courses
  counter= 0
  self.get_courses.each do |post|
    puts post.text
    counter += 1
    if counter % 12== 0
      puts "BIGGERRRR"
    end


  end
end



    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
