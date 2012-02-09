require "net/http"

class PagesController < ApplicationController
  
  def home
    search_str = params[:search_str]
    if search_str.present?
      query = search_str.gsub(/\s/, '+')
      raw_data = Net::HTTP.get(URI.parse("http://search.twitter.com/search.json?q=#{query}&rpp=100"))
      @data = JSON.parse(raw_data)
    end
  end
  
  def love
    search_str = params[:feeling_str]
    if search_str.present?
      query = search_str.gsub(/\s/, '+')
      @love_str = "+I+love+#{query}"
      @hate_str = "+I+hate+#{query}"
      
      #@love_str << 
      love_raw_data = Net::HTTP.get(URI.parse("http://search.twitter.com/search.json?q=#{@love_str}&rpp=100"))
      @love_data = JSON.parse(love_raw_data)
      hate_raw_data = Net::HTTP.get(URI.parse("http://search.twitter.com/search.json?q=#{@hate_str}&rpp=100"))
      @hate_data = JSON.parse(hate_raw_data)
    end 
  end

end
