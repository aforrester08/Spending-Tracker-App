require('sinatra')
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/tag.rb')

also_reload("../models/*")
