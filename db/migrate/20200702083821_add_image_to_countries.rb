class AddImageToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :image, :string
  end
end
