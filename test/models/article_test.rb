require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "should create new comment" do
    article = Article.new
    assert_not article.save
  end

  test "testing valid comment" do
    article = Article.new(description: 'Good',title: 'Good')
    assert_not article.valid?
  end

  test "testing without title" do
    article = Article.new(description: 'Good')
    assert_not article.valid?
  end

  test "testing valid title" do
    article = Article.new(title: 'Good')
    assert_not article.valid?
  end


end
