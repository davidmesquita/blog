class AddAuthorInPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :author, :string
    add_reference :posts, :user, foreign_key: true
  end
end
