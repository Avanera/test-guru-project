class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category

      t.timestamps
    end
    # add_reference(:tests, :category, foreign_key: {to_table: :categories})
  end
end
