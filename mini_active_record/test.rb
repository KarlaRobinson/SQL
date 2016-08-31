require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end


# Chef.new
# puts
# Meal.new
# # all
# p Chef.all
# puts
# puts
# p Meal.all

# #find
# chef = Chef.find(1)
# meal = Meal.find(1)
# assert chef[:first_name] == "Chesley"
# assert meal[:name] == "Chicken Burger"
# #create
# Meal.create(name: 'Stew', chef_id: 3, created_at: '2012-12-01 05:54:30')
# Chef.create(first_name: 'Steve', last_name: 'Rogers', birthday:  Date.today - rand(20..50)*365, email: 'roger@gmail.com', phone: '893.563.7532', created_at: '2012-12-01 05:54:30', updated_at: '2012-12-01 05:54:30')
# save [] and []=

chef = Chef.find(1)
meal = Meal.find(1)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
# assert chef[:first_name] == "Karla"

# p chef.[](:first_name)
# p chef.[]=(:first_name, "Collin")
# p chef.[](:first_name)
# p chef.save
# p chef

# p Chef.all
# # new_record?
# chef = Chef.find(1)
# meal = Meal.find(1)
# assert chef.new_record? == false
# assert meal.new_record? == false

# # where
chef = Chef.where("id == 3")
meal = Meal.where("id == 3")
# assert chef[0][:first_name] == "Dagmar"
# assert meal[0][:name] == "Chicken Pizza"

puts "finished"
