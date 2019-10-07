require('sinatra')
require( 'sinatra/contrib/all' )
require('pry')
require_relative('models/merchant.rb')
require_relative('models/tag.rb')
require_relative('models/transaction.rb')

also_reload("models/*")

get '/tracker' do
  @transactions = Transaction.all()
  erb(:index)
end

get '/tracker/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:new)
end

post "/tracker" do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to('/tracker')
end

get '/tracker/new/merchant' do
  erb(:"merchant/new")
end

post '/tracker/new' do
  Merchant.new(params).save()
  redirect to('/tracker/new')
end

get '/tracker/:id'do
  @transaction = Transaction.find(params['id'].to_i())
  erb(:show)
end

get '/tracker/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:edit)
end

post '/tracker/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to('/tracker/:id')
end
