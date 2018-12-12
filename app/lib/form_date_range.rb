class FormDateRange
  attr_accessor :start_date, :end_date

  def initialize(duration)
    case duration
      when nil # do nothing
      when 'last_7_days'
        @end_date = Time.zone.today
        @start_date = @end_date.ago(7.days).to_date
      when 'last_14_days'
        @end_date = Time.zone.today
        @start_date = @end_date.ago(14.days).to_date
      when 'last_month'
        @end_date = Time.zone.today.last_month.end_of_month.to_date
        @start_date = @end_date.beginning_of_month.to_date
      when 'last_6_months'
        @end_date = Time.zone.today
        @start_date = @end_date.beginning_of_month.ago(6.months).to_date 
      when 'last_year'
        @start_date = Time.zone.today.beginning_of_year.ago(1.year).to_date
        @end_date = @start_date.end_of_year.to_date
      when 'this_year'
        @start_date = Time.zone.today.beginning_of_year.to_date
        @end_date = @start_date.end_of_year.to_date
      else
        @start_date = nil
        @end_date = nil
    end
  end

  def present?
    @start_date && @end_date
  end

  def date_range
    @start_date..@end_date if present?
  end

  def time_range
    (@start_date.in_time_zone..@end_date.in_time_zone.end_of_day) if present?
  end

  def self.select_options
    [
      ['All', 'all'],
      ['Last 7 days', 'last_7_days'], 
      ['Last 2 weeks', 'last_14_days'], 
      ['Last Month', 'last_month'], 
      ['Last 6 Months', 'last_6_months'], 
      ['This Year', 'this_year'], 
      ['Last Year', 'last_year']
    ]
  end
end