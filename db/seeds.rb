# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

begin
	customer ={
		"name": "idrees",
		"address": "model town e block",
		"cnic":"123123123123123"
	}
	item ={
		"item_name": "xyz",
		"item_type": "shampo"
	}
	c=Customer.new(customer)
	i=Item.new(item)
	if c.save
		if i.save
			c_i = c.customer_item.new(item: i)
			if c_i.save
				puts "successfully customer created along with item"
			else
				puts "#{c_i.errors.full_messages}"
			end	
		end	
	end	
end

