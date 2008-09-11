require File.dirname(__FILE__) + '/spec_helper'

describe ImdbMovie do
  
  describe 'Indiana Jones and the Last Crusade' do

    before(:each) do
      @imdb_movie = ImdbMovie.new('0097576', 'Indiana Jones and the Last Crusade')
      @imdb_movie.stub!(:open).and_return(open("#{$samples_dir}/sample_movie.html"))
    end
  
    it "should query IMDB url" do
      @imdb_movie.should_receive(:open).with("http://www.imdb.com/title/tt0097576/").and_return(open("#{$samples_dir}/sample_movie.html"))
      @imdb_movie.send(:document)
    end
  
    it "should get director" do
      @imdb_movie.director.should == 'Steven Spielberg'
    end
  
    it "should get the poster" do
      @imdb_movie.poster.should == 'http://ia.media-imdb.com/images/M/MV5BMTkzODA5ODYwOV5BMl5BanBnXkFtZTcwMjAyNDYyMQ@@._V1._SX95_SY140_.jpg'
    end
  
    it "should get cast members" do
      @imdb_movie.cast_members.should include('Harrison Ford')
      @imdb_movie.cast_members.should include('Sean Connery')
      @imdb_movie.cast_members.should include('Denholm Elliott')
      @imdb_movie.cast_members.should include('Alison Doody')
      @imdb_movie.cast_members.should include('John Rhys-Davies')
      @imdb_movie.cast_members.should_not include('more')
    end
  
    it "should get the writers" do
      @imdb_movie.writers.should include('George Lucas')
      @imdb_movie.writers.should include('Philip Kaufman')
      @imdb_movie.writers.should_not include('more')
    end
  
    it "should get the release date" do
      @imdb_movie.release_date.should be_an_instance_of(Date)
      @imdb_movie.release_date.should == Date.new(1989, 9, 1)
    end
  
    it "should get the genres" do
      @imdb_movie.genres.should have(2).strings
      @imdb_movie.genres.should include('Action')
      @imdb_movie.genres.should include('Adventure')
    end
  
    it "should get the plot" do
      @imdb_movie.plot.should == "When Dr. Henry Jones Sr. suddenly goes missing while pursuing the Holy Grail, eminent archaeologist Indiana Jones must follow in his father's footsteps and stop the Nazis."
    end
  
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
    
    it "should get the tagline" do
      @imdb_movie.tagline.should == "He's back in an all new adventure. Memorial Day 1989."
    end
    
    it "should get the aspect ratio" do
      @imdb_movie.aspect_ratio.should == "2.20 : 1"
    end
    
    describe "title pre-caching & get_data" do
      
      it "should have the original title before querying anything" do
        @imdb_movie.should_not_receive(:open)
        @imdb_movie.title.should == 'Indiana Jones and the Last Crusade'
      end
      
      it "should have the updated title after calling get_data" do
        @imdb_movie.should_receive(:open).with("http://www.imdb.com/title/tt0097576/").and_return(open("#{$samples_dir}/sample_movie.html"))
        @imdb_movie.get_data
        @imdb_movie.title.should == 'Indiana Jones and the Last Crusade'
      end
      
    end
    
  end


  describe 'Han robado una estrella' do

    before(:each) do
      @imdb_movie = ImdbMovie.new('0054961', 'Han robado una estrella')
      @imdb_movie.stub!(:open).and_return(open("#{$samples_dir}/sample_incomplete_movie.html"))
    end
  
    it "should query IMDB url" do
      @imdb_movie.should_receive(:open).with("http://www.imdb.com/title/tt0054961/").and_return(open("#{$samples_dir}/sample_incomplete_movie.html"))
      @imdb_movie.send(:document)
    end
  
    it "should get director" do
      @imdb_movie.director.should == 'Javier Setó'
    end
  
    it "should not get the poster" do
      @imdb_movie.poster.should be_nil
    end
  
    it "should get cast members" do
      @imdb_movie.cast_members.should include('Rafaela Aparicio')
      @imdb_movie.cast_members.should include('Marujita Díaz')
      @imdb_movie.cast_members.should include('Espartaco Santoni')
      @imdb_movie.cast_members.should_not include('more')
    end
  
    it "should get the writers" do
      @imdb_movie.writers.should have(1).string
      @imdb_movie.writers.should include('Paulino Rodrigo')
    end
  
    it "should get the release date" do
      @imdb_movie.release_date.should be_an_instance_of(Date)
      @imdb_movie.release_date.should == Date.new(1963, 9, 9)
    end
  
    it "should get the genres" do
      @imdb_movie.genres.should == ['Comedy', 'Musical']
    end
  
    it "should not get the plot" do
      @imdb_movie.plot.should be_nil
    end
  
    it "should get the length" do
      @imdb_movie.length.should == '93 min'
    end
  
    it "should get the countries" do
      @imdb_movie.countries.should == ['Spain']
    end
  
    it "should get the languages" do
      @imdb_movie.languages.should == ['Spanish']
    end
  
    it "should not get the color" do
      @imdb_movie.color.should be_nil
    end
  
    it "should get the company" do
      @imdb_movie.company.should == 'Brepi Films'
    end
  
    it "should not get any photos" do
      @imdb_movie.photos.should be_empty
    end
    
  end

end