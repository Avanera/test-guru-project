class UpdateForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :questions, :tests
    remove_foreign_key :answers, :questions
    remove_foreign_key :test_passages, :tests

    add_foreign_key :questions, :tests, on_delete: :cascade
    add_foreign_key :answers, :questions, on_delete: :cascade
    add_foreign_key :test_passages, :tests, on_delete: :cascade
  end
end
