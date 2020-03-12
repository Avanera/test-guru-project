class AddNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:users, :email, false)
  end
end
