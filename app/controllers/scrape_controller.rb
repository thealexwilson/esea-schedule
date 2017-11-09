class ScrapeController < ApplicationController
  def scrape
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt1229340/"))

    @title = doc.css('.title_wrapper')[0].css('h1')[0].text
    @rating = doc.css('.ratingValue')[0].css('strong')[0].text
    @release = doc.css('.subtext')[0].css('a')[1].text

    render template: 'scrape/index'
  end
end

