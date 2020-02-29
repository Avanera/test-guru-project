class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
    add_foreign_key :answers, :questions
  end
end
