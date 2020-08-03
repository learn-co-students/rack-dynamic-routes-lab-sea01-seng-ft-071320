class Item
  attr_accessor :name, :price

  @@all = []

  def initialize(name,price)
    @name, @price = name, price

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
