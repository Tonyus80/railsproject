require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "should create new Article" do
    article = Article.new
    assert_not article.save
  end

  test "testing valid Article description" do
    article = Article.new(description: 'Good Article',title: 'Test Article')
    assert_not article.valid?
  end

  test "testing without Description" do
    article = Article.new(description: 'Good')
    assert_not article.valid?
  end

  test "testing valid title" do
    article = Article.new(title: 'Test Article')
    assert_not article.valid?
  end


end
