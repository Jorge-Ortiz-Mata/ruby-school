# data = { name: 'Mario', age: 21 }
# manage_collection('create_one', users_collection, data) # Insert a document

# data = [
#   { name: 'Alice', age: 30 },
#   { name: 'Bob', age: 25 },
#   { name: 'Charlie', age: 35 },
#   { name: 'Jorge', age: 20 },
#   { name: 'Maria', age: 24 },
#   { name: 'Ana', age: 15 },
# ]
# manage_collection('create_many', users_collection, data) # Insert many documents

# documents = manage_collection('list', users_collection) # List all documents

# ==== SORT ASC, DESC ====
# collection.find.sort(name: 1) # ASC
# collection.find.sort(name: -1) # DESC
# collection.find.sort(age: 1) # ASC
# collection.find.sort(age: -1) # DESC

require 'mongo'

def client_connection
  Mongo::Client.new('mongodb://root:example@127.0.0.1:27000/test?authSource=admin')
rescue Mongo::Error::NoServerAvailable => e
  puts "Error: Unable to connect to MongoDB server."
  puts e.message
rescue Mongo::Auth::Unauthorized => e
  puts "Error: Authentication failed."
  puts e.message
end

def manage_collection(action, collection, data = {})
  case action
  when 'create_one'
    collection.insert_one(data)
  when 'create_many'
    collection.insert_many(data)
  when 'list'
    collection.find
  else
    'nothing specified'
  end
end

data = [
  { "name": "", "year": 2017, "make": [{ "id": "jdu2-48dj2-c2hc", "display_name": "Kia", "country": "Korea" }] },
  { "name": "Accord", "year": 2020, "make": [{ "id": "ks82-48dj2-c2hc", "display_name": "Honda", "country": "Japan" }] },
  { "name": "Model S", "year": 2019, "make": [{ "id": "d982-48dj2-c2hc", "display_name": "", "country": "USA" }] },
  { "name": "Golf", "year": 2018, "make": [{ "id": "s982-48dj2-c2hc", "display_name": "12.2", "country": "Germany" }] },
  { "name": "Civic", "year": 2021, "make": [{ "id": "2948-48dj2-c2hc", "display_name": "Honda", "country": "Japan" }] },
  { "name": "Mustang", "year": 2016, "make": [{ "id": "sj28-48dj2-c2hc", "display_name": "", "country": "USA" }] },
  { "name": "", "year": 2019, "make": [{ "id": "28nw-48dj2-c2hc", "display_name": "TOYOTA", "country": "Japan" }] },
  { "name": "Impreza", "year": 2020, "make": [{ "id": "201c-48dj2-c2hc", "display_name": "1_2_ Subaru", "country": "Japan" }] },
  { "name": "A4", "year": 2018, "make": [{ "id": "92nd-48dj2-c2hc", "display_name": "Audi!123", "country": "Germany" }] },
  { "name": "Altima", "year": 2017, "make": [{ "id": "am8d-48dj2-c2hc", "display_name": "1.4.3 Nissan", "country": "Japan" }] }
]

cars_collection = client_connection[:cars_collection]

# manage_collection('create_many', cars_collection, data) # Insert many documents

# cars = manage_collection('list', cars_collection)

# cars = cars_collection.find.sort(make: 1)

cars = cars_collection.aggregate(
  [
    { '$unwind' => '$name' },
    { '$sort' => { 'make.display_name' => 1 } }
  ]
)

puts cars.to_a
