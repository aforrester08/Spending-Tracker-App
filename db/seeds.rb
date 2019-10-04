require('pry')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')


# Tag.delete_all()
# Merchant.delete_all()
# Transaction.delete_all()

tag1 = Tag.new({'type' => 'grocceries'})
tag1.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save()

transaction1 = Transaction.new({
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'amount' => 25
  })

binding.pry
nil
