class Week < ApplicationRecord
  def self.for_current_month
    start = Date.today
    (start..start.end_of_month).select(&:on_weekend?).map(&:cweek).uniq.map do |week_number|
      create_or_find_by(year: start.year, number: week_number)
    end
  end

  def name
    [saturday, sunday].join(" - ")
  end

  private

  SATURDAY = 6
  SUNDAY = 7

  def saturday
    translate_day(SATURDAY)
  end

  def sunday
    translate_day(SUNDAY)
  end

  def translate_day(date)
    I18n.l(build_date(date), format: :short)
  end

  def build_date(day)
    Date.commercial(year, number, day)
  end
end
