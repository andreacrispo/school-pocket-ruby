module GradesHelper

def self.weighted_average(grades)
  total = 0.0
  total_credit = 0.0
  grades.each do |g|
     total += g.grade * g.credit
     total_credit += g.credit
  end
  format("%.2f", total / total_credit)
end

end
