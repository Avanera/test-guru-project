class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default:0
      t.references :category, foreign_key: true

      t.timestamps
    end
    # add_reference(:tests, :category, foreign_key: {to_table: :categories})
  end
end
