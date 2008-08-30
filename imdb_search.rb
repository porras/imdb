class ImdbSearch

  attr_accessor :query

  def initialize(query)
    self.query = query
  end

  def movies
    @movies ||= document.search('a[@href^="/title/tt"]').reject do |element|
      element.innerHTML =~ /<.+>/
    end.map do |element|
      ImdbMovie.new(element['href'][/\d+/], element.innerHTML)
    end
  end

  private
  
  def document
    @document ||= Hpricot(open("http://www.imdb.com/find?s=all&q=#{CGI::escape(query)}").read)
  end

end