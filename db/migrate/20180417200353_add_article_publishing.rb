class AddArticlePublishing < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
      t.boolean :published
      t.index   :title
    end
  end
end
