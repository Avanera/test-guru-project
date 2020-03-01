class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      #t.integer :test_id
      t.references :test

      t.timestamps
    end
    # add_foreign_key :questions, :tests
    # change_column_null(:questions, :body, false)
  end
end
