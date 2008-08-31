require File.dirname(__FILE__) + '/../lib/imdb'

samples_dir = File.dirname(__FILE__) + '/samples'

describe ImdbSearch do

  before(:each) do
    @imdb_search = ImdbSearch.new('Indiana Jones')
    @imdb_search.stub!(:open).and_return(open("#{samples_dir}/sample_search.html"))
  end
  
  it "should query IMDB url" do
    @imdb_search.should_receive(:open).with("http://www.imdb.com/find?s=all&q=Indiana+Jones").and_return(open("#{samples_dir}/sample_search.html"))
    @imdb_search.send(:document)
  end

  describe "movies" do

    it "should be a collection of ImdbMovie instances" do
      @imdb_search.movies.should have(59).imdb_movies
    end

    it "should include 'Indiana Jones and the Last Crusade'" do
      @imdb_search.movies.detect { |m| m.title == 'Indiana Jones and the Last Crusade' }.should_not be_nil
    end

    it "should have titles" do
      @imdb_search.movies.each do |movie|
        movie.title.should_not be_empty
      end
    end
    
    it "should not have titles with HTML tags" do
      @imdb_search.movies.each do |movie|
        movie.title.should_not match(/<.+>/)
      end
    end
    
  end

end

describe ImdbMovie do

  before(:each) do
    @imdb_movie = ImdbMovie.new('0097576', 'Indiana Jones and the Last Crusade')
    @imdb_movie.stub!(:open).and_return(open("#{samples_dir}/sample_movie.html"))
  end
  
  it "should query IMDB url" do
    @imdb_movie.should_receive(:open).with("http://www.imdb.com/title/tt0097576/").and_return(open("#{samples_dir}/sample_movie.html"))
    @imdb_movie.send(:document)
  end
  
  it "should get director" do
    @imdb_movie.director.should == 'Steven Spielberg'
  end
  
  it "should get the poster" do
    @imdb_movie.poster.should == 'http://ia.media-imdb.com/images/M/MV5BMTkzODA5ODYwOV5BMl5BanBnXkFtZTcwMjAyNDYyMQ@@._V1._SX95_SY140_.jpg'
  end
  
  it "should get cast members" do
    cast = @imdb_movie.cast_members
    cast.should include('Harrison Ford')
    cast.should include('Sean Connery')
    cast.should include('Denholm Elliott')
    cast.should include('Alison Doody')
    cast.should include('John Rhys-Davies')
    cast.should_not include('more')
  end
  
  it "should get the writers" do
    writers = @imdb_movie.writers
    writers.should include('George Lucas')
    writers.should include('Philip Kaufman')
    writers.should_not include('more')
  end
  
  it "should get the release date"
  
  it "should get the genres" do
    genres = @imdb_movie.genres
    genres.should have(2).strings
    genres.should include('Action')
    genres.should include('Adventure')
  end
  
  it "should get the plot"
  
  it "should get the length" do
    @imdb_movie.length.should == '127 min'
  end
  
  it "should get the countries" do
    @imdb_movie.countries.should have(1).string
    @imdb_movie.countries.should include('USA')
  end
  
  it "should get the languages" do
    @imdb_movie.languages.should have(3).strings
    @imdb_movie.languages.should include('English')
    @imdb_movie.languages.should include('German')
    @imdb_movie.languages.should include('Greek')
  end
  
  it "should get the color" do
    @imdb_movie.color.should == 'Color'
  end
  
  it "should get the company" do
    @imdb_movie.company.should == 'Lucasfilm'
  end
  
  it "should get some photos" do
    @imdb_movie.photos.should have(10).strings
    @imdb_movie.photos.should include('http://ia.media-imdb.com/images/M/MV5BMTY4MzY3OTY0MF5BMl5BanBnXkFtZTYwODM0OTE3._V1._CR82,0,320,320_SS90_.jpg')
    @imdb_movie.photos.should include('http://ia.media-imdb.com/images/M/MV5BMjAwNTM4ODc3Nl5BMl5BanBnXkFtZTYwNzU0OTE3._V1._CR82,0,320,320_SS90_.jpg') 
  end

end