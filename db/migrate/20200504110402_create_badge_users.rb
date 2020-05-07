class CreateBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_users do |t|
      t.references :badge, foreign_key: true, on_delete: :cascade
      t.references :user, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
