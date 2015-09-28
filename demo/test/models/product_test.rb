require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "Properties required" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
  end

  test "Price must be numeric + positive" do
    product = Product.new(
      title: 'Test product one',
      description: 'some descr',
      image_url: 'someImageUrl'
    )
    errMsg = 'must be greater than or equal to 0.01'
    product.price = -1
    assert product.invalid?
    assert_equal [errMsg], product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal [errMsg], product.errors[:price]
    product.price = 1
    assert product.valid?
  end

  test "Should not allow a duplicate product title" do
    product = Product.new(
      title: products(:ruby).title,
      description: 'This is the second descrption',
      image_url: 'http://someUrl.com',
      price: 20.00
    )
    assert product.invalid?
    assert_equal ['has already been taken'], product.errors[:title]
  end

end
