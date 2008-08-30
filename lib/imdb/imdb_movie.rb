class ImdbMovie
  
  attr_accessor :id, :url, :title
  
  def initialize(id, title = nil)
    @id = id
    @url = "http://www.imdb.com/title/tt#{self.id}/"
    @title = title
  end
  
  def director
    document.at("h5[text()='Director:'] ~ a").innerHTML rescue 'Unknown'
  end
  
  def poster
    document.at("a[@name='poster'] img")['src']
  end
  
  def cast_members
    document.search("table.cast td.nm a").map { |link| link.innerHTML }
  end
  
  def writers
    document.search("h5[text()^='Writers'] ~ a").map { |link| link.innerHTML }.reject { |w| w == 'more' }
  end
  
  def genres
    document.search("h5[text()='Genre:'] ~ a[@href*=/Sections/Genres/']").map { |link| link.innerHTML }
  end
  
  private
  
  def document
    @document ||= Hpricot(open(self.url).read)
  end
  
end