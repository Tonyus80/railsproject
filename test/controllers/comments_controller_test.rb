require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do

    @user = users(:one)
    sign_in @user
    @comment = comments(:one)
  end

  test "should get index" do
    get article_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_article_comment_url
    assert_response :success
  end

  # test "should create comment" do
  #   assert_difference('Comment.count') do
  #     post article_comments_url, params: { comment: { article_id: @comment.article_id, content: @comment.content, user_id: @comment.user_id } }
  #   end
  #
  #   assert_redirected_to article_comment_url(Comment.last)
  # end
  #
  test "should create comment" do

    assert_difference('Comment.count', 1) do
      post article_comments_url, params: { comment: { content: @comment.content, user_id: @comment.user_id, article_id: @comment.article_id } }
    end

    assert_redirected_to article_comment_url(Comment.last)
  end

  test "should show comment" do
    get article_comments_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_comment_path(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch article_comments_url(@comment), params: { comment: { article_id: @comment.article_id, content: @comment.content, user_id: @comment.user_id } }
    assert_redirected_to article_comments_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete article_comments_url(@comment)
    end

    assert_redirected_to article_comments_url
  end
end
