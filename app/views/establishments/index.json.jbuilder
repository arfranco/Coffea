json.array! @establishments do |establishment|
  json.id establishment.id
  json.name establishment.name
  json.street_address establishment.street_address
  json.city establishment.city
  json.state establishment.state
  json.zip_code establishment.zip_code
  json.coffee_quality establishment.coffee_quality
  json.ambiance establishment.ambiance
  json.price establishment.price
  json.wifi establishment.wifi
end