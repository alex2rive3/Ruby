class AddUserIdToCommentis < ActiveRecord::Migration[6.1]
  def change
    add_reference :commentis, :user, null: false, foreign_key: true
  end
end
