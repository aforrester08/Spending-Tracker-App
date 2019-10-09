require('sinatra')
require( 'sinatra/contrib/all' )
require('pry')
require_relative('controllers/transaction_controllers.rb')
require_relative('controllers/tag_controllers.rb')
require_relative('controllers/merchant_controllers.rb')
require_relative('models/merchant.rb')
require_relative('models/tag.rb')
require_relative('models/transaction.rb')
require_relative('models/budget.rb')
also_reload("models/*")

get '/tracker' do
  @transactions = Transaction.all()
  @budget = Budget.all()
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

#merchant

get '/tracker/new/merchant' do
  erb(:"merchant/new")
end

post '/tracker/new' do
  Merchant.new(params).save()
  redirect to('/tracker/new')
end

#merchant end

#tag

get '/tracker/tag/new' do
  erb(:"tag/new")
end

post '/tracker/tag' do
  Tag.new(params).save()
  redirect to('/tracker/new')
end

#tag

#Budget

get '/tracker/new_budget' do
  erb(:"budget/new")
end

post "/tracker/budget" do
  Budget.new(params).save()
  redirect to("/tracker")
end

#Budget

#Filters

get '/tracker/time_filter' do
  @transactions = Transaction.all_sorted_by_date()
  erb(:'filter/time')
end

get '/tracker/merchant_filter/:merchant_id' do
  @transactions = Transaction.filter_by_merchant(params[:merchant_id])
  erb(:'filter/merchant')
end

get '/tracker/tag_filter' do
  @transactions = Transaction.all()
  erb(:'filter/tag')
end

get '/tracker/amount_filter' do
  @transactions = Transaction.all()
  erb(:'filter/amount')
end

#Filters

get '/tracker/:id'do
  @transaction = Transaction.find(params['id'].to_i())
  erb(:show)
end

get '/tracker/:id/edit' do
  @merchants = Merchant.all
  @tags = Tag.all
  @transaction = Transaction.find(params['id'])
  erb(:edit)
end

post '/tracker/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to("/tracker/#{params['id']}")
end

post '/tracker/:id/delete' do
  transaction = Transaction.find(params['id'].to_i())
  transaction.delete()
  redirect to("/tracker")
end
