class AddAnswersCorrectAndTestsLevelDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :answers, :correct, from:true, to:false
    change_column_default :tests, :level, from: nil, to: "0"
  end
end
