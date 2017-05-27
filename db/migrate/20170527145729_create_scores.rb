class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :flow_balance
      t.integer :impact_factor
      t.integer :conclusion
      t.integer :question_and_answer
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
