class Score < ApplicationRecord
	belongs_to :project
  belongs_to :user

  def average
    result = (flow_balance * 0.35) + (impact_factor * 0.15) + (conclusion * 0.2) + (question_and_answer * 0.3)
    '%.2f' % result
  end
end
