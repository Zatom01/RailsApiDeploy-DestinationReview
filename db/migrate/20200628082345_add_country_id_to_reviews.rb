class AddCountryIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :country_id, :integer
  end
end
