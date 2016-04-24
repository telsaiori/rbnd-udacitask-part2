class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

  def initialize(type, url, options={})
    @type = type
    @description = url
    @site_name = options[:site_name]
  end
  def format_name
    @site_name ? @site_name : ""
  end
  

  def details
    "Type: #{@type.capitalize}".ljust(12) + format_description(@description) + "site name: " + format_name
  end
end
