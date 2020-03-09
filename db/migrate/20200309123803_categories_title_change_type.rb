class CategoriesTitleChangeType < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :title, :string
  end
end
