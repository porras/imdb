class ImdbSearch

  attr_accessor :query

  def initialize(query)
    self.query = query
  end

  def movies
    @movies ||= MoviesScraper.scrape(html)
  end

  MovieScraper = Scraper.define do
    process HTML::Selector.new("a[href=/title/tt?]", /(\d+)/), :title => :text, :url => "@href"
    result :title, :url
  end

  MoviesScraper = Scraper.define do
    array :movies
    process "td", :movies => MovieScraper
    result :movies
  end

  def html
    @html ||= open("http://www.imdb.com/find?s=all&q=#{query}").read
  end

end