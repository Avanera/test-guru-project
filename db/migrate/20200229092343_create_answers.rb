class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :correct, null: false, default: false
      t.references :question
      # t.integer :question_id

      t.timestamps
    end
    # add_foreign_key :answers, :questions
    # change_column_default :answers, :correct, from:true, to:false
  end
end
