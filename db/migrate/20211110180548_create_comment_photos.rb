class CreateCommentPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_photos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
