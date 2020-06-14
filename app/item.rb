class Item
  attr_accessor :name, :price

  @@item = []

  def initialize(name,price)
    @name = name
    @price = price
    save 
  end

  def save
    @@item << self
  end

  def self.all
    @@item  
  end
end
