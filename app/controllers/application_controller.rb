class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all bakeries from the database
    # send them back as a JSON array
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    #returns an array of baked goods
    goods_by_price = BakedGood.order(price: :desc)
    #as JSON sorted by price in descending order
    goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive_baked_good = BakedGood.order(price: :desc).first
    most_expensive_baked_good.to_json(only: [:name, :price])
  end

end
