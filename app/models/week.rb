class Week < ApplicationRecord
  def self.for_current_month
    start = Date.today
    @current_available_weeks = (start..start.end_of_month).select(&:on_weekend?).map(&:cweek).uniq.map do |week_number|
      create_or_find_by(year: start.year, number: week_number)
    end
  end

  def name
    [I18n.l(Date.commercial(year, number, 6), format: :short), I18n.l(Date.commercial(year, number, 6), format: :short)].join(" - ")
  end
end
