require File.dirname(__FILE__) + '/spec_helper'

describe String do
  
  describe "unescape_html" do
    
    it "should convert &amp; to &" do
      "M&amp;M".unescape_html.should == 'M&M'
    end
    
    it "should convert &#243; to ó" do
      "&#243;smosis".unescape_html.should == 'ósmosis'
    end
    
  end
  
  describe "strip_tags" do
    
    it "should strip HTML tags" do
      "<em>Hola</em> hola".strip_tags.should == 'Hola hola'
    end
    
  end
  
end