class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :city_visited
      t.string :date_visited
      t.string :experience

      t.timestamps
    end
  end
end
