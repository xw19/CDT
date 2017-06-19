json.name @dealership.name
json.logo @dealership.logo

json.models @dealership.models do |model|
  json.id model.id
  json.brand model.car.make.name
  json.name  model.car.model
  json.year model.year
  json.price number_to_currency(model.price, currency: '$')
end
