require File.dirname(__FILE__) + '/spec_helper'

describe ImdbSearch do

  describe 'Indiana Jones' do

    before(:each) do
      @imdb_search = ImdbSearch.new('Indiana Jones')
      @imdb_search.stub!(:open).and_return(open("#{$samples_dir}/sample_search.html"))
    end

    it "should query IMDB url" do
      @imdb_search.should_receive(:open).with("http://www.imdb.com/find?s=all&q=Indiana+Jones").and_return(open("#{$samples_dir}/sample_search.html"))
      @imdb_search.send(:document)
    end

    describe "movies" do

      it "should be a collection of ImdbMovie instances" do
        @imdb_search.movies.should be_an_instance_of(Array)
        @imdb_search.movies.should_not be_empty
        @imdb_search.movies.each do |movie|
          movie.should be_an_instance_of(ImdbMovie)
        end
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

end