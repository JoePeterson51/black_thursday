require_relative 'sales_engine'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(path)
    @merchants = []
    make_merchants(path)
  end

  def make_merchants(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      @merchants << Merchant.new(row)
    end
  end

  def all
    @merchants
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      merchant.id == id
    end
  end

  def find_by_name(name)
    @merchants.find do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_name(name)
    @merchants.find_all do |merchant|
      merchant.name.downcase.include?(name.downcase)
    end
  end

  def create(attributes)
    max_id = @merchants.max_by do |merchant|
      merchant.id
    end
    attributes[:id] = max_id.id + 1
    @merchants << Merchant.new(attributes)
  end

  def update(id, attributes)
    updatee = find_by_id(id)
    updatee.name.replace attributes
  end

  def delete(id)
    deletee = find_by_id(id)
    @merchants.delete(deletee)
  end
end