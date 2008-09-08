class ImdbSearch

  attr_accessor :query

  def initialize(query)
    self.query = query
  end

  def movies
    @movies ||= document.search('a.l[@href*="/title/tt"]').map do |element|
      ImdbMovie.new(element['href'][/\d+/], element.innerHTML.strip_tags)
    end
  end

  private
  
  def document
    @document ||= Hpricot(open("http://www.google.com/search?as_q=#{CGI::escape(query + ' inurl:title')}&num=20&as_sitesearch=imdb.com").read)
  end

end