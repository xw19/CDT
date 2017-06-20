json.array! @models do |model|
  json.id model.id
  json.brand model.car.make.name
  json.name  model.car.model
  json.thumb model.master_picture
  json.year model.year
  json.price number_to_currency(model.price, currency: '$')
end
