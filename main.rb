require_relative 'factory.rb'

Customer1 = Factory.new(:name, :address, :zip)

joe = Customer1.new('Joe Smith', '123 Maple, Anytown NC', 12345)

p joe.name
p joe['name']
p joe[:name]
p joe[0]

Customer2 = Struct.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

p Customer2.new('Dave', '123 Main').greeting