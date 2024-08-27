# app/views/api/v1/products/show.json.jbuilder

json.id @product.id
json.title @product.title
json.description @product.description
json.category @product.category
json.price @product.price
json.discount_percentage @product.discount_percentage
json.rating @product.rating
json.stock @product.stock
json.tags @product.tags.pluck(:name)
json.brand @product.brand
json.sku @product.sku
json.weight @product.weight

json.dimensions do
  json.width @product.dimension.width
  json.height @product.dimension.height
  json.depth @product.dimension.depth
end

json.warranty_information @product.warranty_information
json.shipping_information @product.shipping_information
json.availability_status @product.availability_status

json.reviews @product.reviews do |review|
  json.rating review.rating
  json.comment review.comment
  json.date review.date
  json.reviewer_name review.reviewer_name
  json.reviewer_email review.reviewer_email
end

json.return_policy @product.return_policy
json.minimum_order_quantity @product.minimum_order_quantity

json.meta do
  json.created_at @product.meta_created_at
  json.updated_at @product.meta_updated_at
  json.barcode @product.barcode
  json.qr_code @product.qr_code
end

json.images @product.images.pluck(:url)
json.thumbnail @product.thumbnail
