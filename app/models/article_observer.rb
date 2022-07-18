class ArticleObserver < ActiveRecord::Observer
  def after_commit(article)
    notifications = Notification.create(
      ##Observer
      #add notifications into database by article.id <p> Pharagraph
      content_notification: "
        <p>
          New Article #{article.title} was posted
        </p>
        <p>View the Article <a href=\"/articles/#{article.id}\">here</a></p>
        "
    )
    notifications.save
  end


end
