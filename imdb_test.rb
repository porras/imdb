require 'imdb'
require 'test/unit'
require 'shoulda'

# I didn't manage to mock Kernel#open so I did it old school way
module Kernel
  private
  alias original_open open
  def open(dummy, *dummy_params, &dummy_block)
    original_open('sample_search.html')
  end
end

class ImdbTest < Test::Unit::TestCase
  
  context "ImdbSearch" do
    
    setup do
      @imdb_search = ImdbSearch.new('Harrison Ford')      
    end

    context "movies" do
      
      setup do
        @movies = @imdb_search.movies
      end
      
      should "be an array" do
        assert_kind_of(Array, @movies)
      end
      
      should "be composed of ImdbMovie objects" do
        @movies.each do |movie|
          assert_kind_of(ImdbMovie, movie)
        end
      end
      
      should "include 'Indiana Jones and the Last Crusade'" do
        assert @movies.map { |m| m.title }.include?('Indiana Jones and the Last Crusade')
      end
      
      should "have a title (without HTML tags)" do
        @movies.each do |movie|
          assert !movie.title.empty?
          assert movie.title[/<.+>/].nil?, "'#{movie.title}' has HTML tags!"
        end
      end
            
    end
    
  end

end
