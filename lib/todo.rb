class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type
  attr_writer :priority

  def initialize(type, description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = type
  end


  def details
    format_description(@description) + "due: " +
    format_date(due: @due) +
    format_priority(@priority)
  end
end
