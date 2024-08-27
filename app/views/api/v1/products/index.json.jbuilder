# app/views/api/v1/products/index.json.jbuilder

json.products @products do |product|
  json.id product.id
  json.title product.title
  json.description product.description
  json.category product.category
  json.price product.price
  json.discountPercentage product.discount_percentage
  json.rating product.rating
  json.stock product.stock
  json.tags product.tags.pluck(:name)
  json.brand product.brand
  json.sku product.sku
  json.weight product.weight

  json.dimensions do
    json.width product.dimension.width
    json.height product.dimension.height
    json.depth product.dimension.depth
  end

  json.warrantyInformation product.warranty_information
  json.shippingInformation product.shipping_information
  json.availabilityStatus product.availability_status

  json.reviews product.reviews do |review|
    json.rating review.rating
    json.comment review.comment
    json.date review.date
    json.reviewerName review.reviewer_name
    json.reviewerEmail review.reviewer_email
  end

  json.returnPolicy product.return_policy
  json.minimumOrderQuantity product.minimum_order_quantity

  json.meta do
    json.createdAt product.meta_created_at
    json.updatedAt product.meta_updated_at
    json.barcode product.barcode
    json.qrCode product.qr_code
  end

  json.images product.images.pluck(:url)
  json.thumbnail product.thumbnail
end

json.total Product.count
json.skip params[:skip] || 0
json.limit params[:limit] || 50
