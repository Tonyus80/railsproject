require 'news-api'
require 'open-uri'

class NewsController < ApplicationController


  def index

    @getTopHeadlines = newsApiHeadlines()


    #set_cookie()
    #show_cookie()

    #if !current_user
    # reset()
    # end

  end

  # NewsApi request for top headlines with Irish sources
  def newsApiHeadlines

      ###souce from https://newsapi.org/
      #newsApi = News.new("cea9afd6-040a-4ca2-8d62-4338f3a11d0a")
      newsApi = News.new("b73f39119cc047faafb2c0aba0423aac")
      #topHeadlines = newsApi.get_top_headlines(country: 'ie')

      topHeadlines = newsApi.get_top_headlines(category: 'health',
                                                language: 'en',
                                                country: 'ie')
  end

  def guardianNewsApiHeadlines

      ###souce from https://newsapi.org/
      guardianNews = News.new("cea9afd6-040a-4ca2-8d62-4338f3a11d0a")
      #topHeadlines = newsApi.get_top_headlines(country: 'ie')

      topHeadlines = guardianNews.get_top_headlines(category: 'health',
                                               language: 'en',
                                               country: 'ie')
  end

end

