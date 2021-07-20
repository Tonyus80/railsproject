json.extract! comment, :id, :content, :created_by, :article_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
