class CreateArticleObservers < ActiveRecord::Migration[6.1]
  def change
    create_table :article_observers do |t|

      t.timestamps
    end
  end
end
