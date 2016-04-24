class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type

  def initialize(type, description, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    @type = type
  end
  

  def details
    "Type: #{@type.capitalize}".ljust(12) + format_description(@description) + "event dates: " + format_date(start_date: @start_date, end_date: @end_date)
  end
end
