json.brand @model.car.make.name
json.name @model.car.model
json.year @model.year
json.price number_to_currency(@model.price, currency: '$')
