class Project < ApplicationRecord
	has_many :scores

  def average
    result = 0

    if !scores.empty?
      scores.each { |s| result += s.average.to_f }
      result /= scores.count.to_f
    end

    '%.2f' % result
  end

  def presenter_average
    result = scores.empty? ? 0 : scores.sum(:presenter) / scores.count.to_f
    '%.2f' % result
  end
end
