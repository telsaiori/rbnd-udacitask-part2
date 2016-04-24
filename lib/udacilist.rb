class UdaciList
  attr_reader :title, :items
  attr_writer :title

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type == "todo" || type == "event" || type == "link"
      priority = ["high", "medium", "low", nil]
      raise UdaciListErrors::InvalidPriorityValue unless priority.include?options[:priority]
      case type
      when "todo"
        @items.push TodoItem.new(type, description, options)
      when "event"
        @items.push EventItem.new(type, description, options)
      when "link"
        @items.push LinkItem.new(type, description, options)
      else
        raise UdaciListErrors::InvalidItemType
      end
    end
  end
  
  #Allow deletion of multiple items
    def delete(*index)
      index.each do |no|
        if no > @items.size
          raise UdaciListErrors::IndexExceedsListSize
        else
          @items.delete_at(no - 1)
        end
      end
    end
  # def delete(index)
  #   if index > @items.size
  #     raise UdaciListErrors::IndexExceedsListSize
  #   else
  #     @items.delete_at(index - 1)
  #   end
  # end
  def all
    if @title
      puts "-" * @title.length
      puts @title
      puts "-" * @title.length
    else
      @title = "UNTITLED LIST"
      puts "-" * @title.length
      puts @title
      puts "-" * @title.length
    end
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
  
  def filter(type)
    type_filter = @items.select{|todo| todo.type == type}
    if type_filter.empty?
      puts "No such item type"
    else
      puts type.capitalize   + " List"
      puts "-" * type.length
      tp type_filter
      # type_filter.each do |item|
      #   puts item.details
      # end
      puts "-" * type.length
    end
  end
  
# Change the priority levels of items
  def change_priority(description, priority)
    need_change = @items.select {|item| item.description == description}
    need_change.map{|item| item.priority = priority}
  end

end
