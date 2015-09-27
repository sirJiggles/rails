# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

# %{ ... } is for double quoted strings
Product.create!(
  title: 'Product One',
  description: %{<p>
    This is the first product description
    </p>},
  price: 23.00,
  image_url: 'http://placepu.gs/210/210'
);

Product.create!(
  title: 'Product Two',
  description: '<p>This is the second product description</p>',
  price: 100.00,
  image_url: 'http://placepu.gs/200/200'
);