class AvailableDay < ApplicationRecord
  has_and_belongs_to_many :users

  def self.for_current_month
    days = where(arel_table[:date].gt(Date.today))
    create_days_for_current_month if days.count <= 2
    days
  end

  def self.create_days_for_current_month
    start_date = Date.today.next_month.beginning_of_month
    end_date = start_date.end_of_month
    (start_date..end_date).select(&:on_weekend?).each do |date|
      create_or_find_by(date: date)
    end
  end

  def short_date
    I18n.l(date, format: :short)
  end
end
