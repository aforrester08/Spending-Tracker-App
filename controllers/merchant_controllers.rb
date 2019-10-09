require('sinatra')
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload("../models/*")


get '/tracker/new/merchant' do
  erb(:"merchant/new")
end

post '/tracker/new' do
  Merchant.new(params).save()
  redirect to('/tracker/new')
end
