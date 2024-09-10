# db/seeds.rb

require 'faker'

# Clear existing data
Dimension.delete_all
Tag.delete_all
Review.delete_all
Image.delete_all
Product.delete_all
Setting.delete_all
Store.delete_all

# Helper method to create random tags
def random_tags
  categories = [ "beauty", "fragrances", "furniture", "groceries", "home-decoration", "kitchen-accessories" ]
  Array.new(rand(1..3)) { categories.sample }
end

store1 = Store.create!(name: 'tienda 1', identification: 'MSS34', host_name: 'tienda1.e-lead-dev.com')
store2 = Store.create!(name: 'tienda 2', identification: 'HIJ55', host_name: 'tienda2.e-lead-dev.com')
store3 = Store.create!(name: 'tienda 3', identification: 'DTS32', host_name: 'tienda3.e-lead-dev.com')
store4 = Store.create!(name: 'localhost', identification: 'LCH30', host_name: 'localhost:3000')


store1.settings.create(data: {
  primaryColor: '#34A853',
  secondaryColor: '#F5F5F5',
  fontFamily: 'Arial, sans-serif',
  fontSize: '16px',
  logo: '/logo.png',
  navLinks: [ 'SHOP', 'MORE PRODUCT OPTIONS', 'GIFT CODES', 'RETURN POLICY', 'CONTACT' ]
})

store2.settings.create(data: {
  primaryColor: '#FF5733',
  secondaryColor: '#333333',
  fontFamily: 'Verdana, sans-serif',
  fontSize: '14px',
  logo: '/logo2.png',
  navLinks: [ 'HOME', 'SALE', 'BLOG', 'ABOUT', 'CONTACT' ]
})

store3.settings.create(data: {
  primaryColor: '#33dbff',
  secondaryColor: '#F5F5F5',
  fontFamily: 'Arial, bold',
  fontSize: '12px',
  logo: '/logo3.png',
  navLinks: [ 'ABOUT', 'RETURN POLICY', 'BLOG', 'ABOUT US', 'CONTACT US' ]
})

store4.settings.create(data: {
  primaryColor: '#333333',
  secondaryColor: '#FF5733',
  fontFamily: 'Verdana, sans-serif',
  fontSize: '18px',
  logo: '/logo4.png',
  navLinks: [ 'ABOUT', 'RETURN POLICY', 'BLOG', 'ABOUT US', 'CONTACT US' ]
})

# Create 300+ products with random data
300.times do
  # Create a product
  store = [store1, store2, store3, store4].sample
  product = Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    category: random_tags.first,
    price: Faker::Commerce.price(range: 5.0..5000.0),
    discount_percentage: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    rating: Faker::Number.between(from: 1.0, to: 5.0).round(2),
    stock: Faker::Number.between(from: 1, to: 100),
    brand: store.name,
    sku: Faker::Alphanumeric.alphanumeric(number: 8).upcase,
    weight: Faker::Number.decimal(l_digits: 1, r_digits: 2),
    warranty_information: "#{Faker::Number.between(from: 1, to: 5)} year warranty",
    shipping_information: [ "Ships in 1-2 business days", "Ships in 1 week", "Ships in 1 month" ].sample,
    availability_status: [ "In Stock", "Low Stock", "Out of Stock" ].sample,
    return_policy: "#{Faker::Number.between(from: 7, to: 90)} days return policy",
    minimum_order_quantity: Faker::Number.between(from: 1, to: 50),
    meta_created_at: Faker::Time.between(from: 2.years.ago, to: Time.now),
    meta_updated_at: Faker::Time.between(from: 1.year.ago, to: Time.now),
    barcode: Faker::Number.number(digits: 13).to_s,
    qr_code: Faker::Internet.url(host: 'assets.dummyjson.com', path: '/public/qr-code.png'),
    thumbnail: Faker::LoremFlickr.image(size: "50x60"),
    store:
  )

  # Create dimensions
  product.create_dimension!(
    width: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    height: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    depth: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )

  # Create 3 to 5 random reviews
  rand(3..5).times do
    product.reviews.create!(
      rating: Faker::Number.between(from: 1, to: 5),
      comment: Faker::Lorem.sentence(word_count: 8),
      date: Faker::Time.between(from: 1.year.ago, to: Time.now),
      reviewer_name: Faker::Name.name,
      reviewer_email: Faker::Internet.email
    )
  end

  # Attach random images
  rand(1..3).times do
    product.images.create!(url: Faker::LoremFlickr.image(size: "300x200"))
  end

  # Attach random tags
  random_tags.each do |tag_name|
    tag = Tag.find_or_create_by!(name: tag_name)
    product.tags << tag
  end
end

puts "Seeded #{Product.count} products."
