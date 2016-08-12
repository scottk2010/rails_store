require "test_helper"

describe ProductsController do
  let(:product) { products :one }

  it "gets index" do
    get products_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_product_url
    value(response).must_be :success?
  end

  it "creates product" do
    expect {
      post products_url, params: { product: { image: product.image, name: product.name, price: product.price } }
    }.must_change "Product.count"

    must_redirect_to product_path(Product.last)
  end

  it "shows product" do
    get product_url(product)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_product_url(product)
    value(response).must_be :success?
  end

  it "updates product" do
    patch product_url(product), params: { product: { image: product.image, name: product.name, price: product.price } }
    must_redirect_to product_path(product)
  end

  it "destroys product" do
    expect {
      delete product_url(product)
    }.must_change "Product.count", -1

    must_redirect_to products_path
  end
end
