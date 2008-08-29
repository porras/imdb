class ImdbSearch

  attr_accessor :query

  def initialize(query)
    self.query = query
  end

  def movies
    @movies ||= document.search('a[@href^="/title/tt"]')
  end

  private
  
  def document
    @document ||= Hpricot(open("http://www.imdb.com/find?s=all&q=#{CGI::escape(query)}").read)
  end

end