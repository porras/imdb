class ImdbSearch

  def initialize(query)
    @query = query
  end

  def movies
    @movies ||= document.search('a[@href^="/title/tt"]').reject do |element|
      element.innerHTML.strip_tags.empty?
    end.map do |element|
      [element['href'][/\d+/], element.innerHTML.strip_tags.unescape_html]
    end.uniq.map do |values|
      ImdbMovie.new(*values)
    end
  end

  private
  
  def document
    @document ||= Hpricot(open("http://www.imdb.com/find?q=#{CGI::escape(@query)};s=tt").read)
  end

end