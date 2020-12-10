class AddPasswordToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :password, :string
  end
end
