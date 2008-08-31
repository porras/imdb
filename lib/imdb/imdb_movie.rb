class ImdbMovie
  
  attr_accessor :id, :url, :title
  
  def initialize(id, title = nil)
    @id = id
    @url = "http://www.imdb.com/title/tt#{self.id}/"
    @title = title
  end
  
  def director
    document.at("h5[text()='Director:'] ~ a").innerHTML.strip
  end
  
  def poster
    document.at("a[@name='poster'] img")['src']
  end
  
  def cast_members
    document.search("table.cast td.nm a").map { |link| link.innerHTML.strip }
  end
  
  def writers
    document.search("h5[text()^='Writers'] ~ a").map { |link| link.innerHTML.strip }.reject { |w| w == 'more' }
  end
  
  def release_date
    date = document.search("//h5[text()^='Release Date']/..").innerHTML[/^\d{1,2} \w+ \d{4}/]
    Date.parse(Chronic.parse(date).strftime('%Y/%m/%d'))
  end
  
  def genres
    document.search("h5[text()='Genre:'] ~ a[@href*=/Sections/Genres/']").map { |link| link.innerHTML.strip }
  end
  
  def length
    document.search("//h5[text()^='Runtime']/..").innerHTML[/\d+ min/]
  end

  def countries
    document.search("h5[text()='Country:'] ~ a[@href*=/Sections/Countries/']").map { |link| link.innerHTML.strip }
  end

  def languages
    document.search("h5[text()='Language:'] ~ a[@href*=/Sections/Languages/']").map { |link| link.innerHTML.strip }
  end
  
  def color
    document.at("h5[text()='Color:'] ~ a[@href*=color-info']").innerHTML.strip
  end

  def company
    document.at("h5[text()='Company:'] ~ a[@href*=/company/']").innerHTML.strip
  end
  
  def photos
    document.search(".media_strip_thumb img").map { |img| img['src'] }
  end
    
  private
  
  def document
    @document ||= Hpricot(open(self.url).read)
  end
  
end