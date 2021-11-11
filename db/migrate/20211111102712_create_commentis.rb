class CreateCommentis < ActiveRecord::Migration[6.1]
  def change
    create_table :commentis do |t|
      t.references :commentable, polymorphic: true, null: false
      t.string :username
      t.text :message

      t.timestamps
    end
  end
end
