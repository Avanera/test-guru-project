class AddPassageTimeToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passage_time, :integer
  end
end
