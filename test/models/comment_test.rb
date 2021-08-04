require "test_helper"

class CommentTest < ActiveSupport::TestCase

  test "should create new comment" do
    comment = Comment.new
    assert_not comment.save
  end

  test "testing valid comment" do
    comment = Comment.new(content: 'Good')
    assert_not comment.valid?
  end

  test "testing without comment" do
    comment = Comment.new()
    assert_not comment.valid?
  end


end
