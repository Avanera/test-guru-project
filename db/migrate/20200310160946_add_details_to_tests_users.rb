class AddDetailsToTestsUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :tests_users do |t|
      t.index [:user_id, :test_id], unique: true
    end
  end
end
