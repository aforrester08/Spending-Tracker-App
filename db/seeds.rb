require('pry')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


tag1 = Tag.new({'type' => 'Groceries'})
tag1.save()

tag2 = Tag.new({'type' => 'Entertainment'})
tag2.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save()

merchant2 = Merchant.new({'name' => 'Bowling Place'})
merchant2.save()

transaction1 = Transaction.new({
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'amount' => 25
  })
transaction1.save()

transaction2 = Transaction.new({
  'merchant_id' => merchant2.id,
  'tag_id' => tag2.id,
  'amount' => 50
  })
transaction2.save()

binding.pry
nil
