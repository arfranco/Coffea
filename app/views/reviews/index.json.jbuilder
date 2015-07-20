json.array! @reviews do |review|
  json.id review.id
  json.content review.content
  json.user_id review.user_id
  json.establishment_id review.establishment_id
  json.flagged review.flagged
  json.image_url review.image_url
end