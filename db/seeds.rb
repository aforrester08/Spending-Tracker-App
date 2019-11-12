require('pry')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/budget')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()
Budget.delete_all()


tag1 = Tag.new({'type' => 'Bills'})
tag1.save()

tag2 = Tag.new({'type' => 'Finances'})
tag2.save()

tag3 = Tag.new({'type' => 'Eating Out'})
tag3.save()

tag4 = Tag.new({'type' => 'Entertainment'})
tag4.save()

tag5 = Tag.new({'type' => 'Expenses'})
tag5.save()

tag6 = Tag.new({'type' => 'Family'})
tag6.save()

tag7 = Tag.new({'type' => 'General'})
tag7.save()

tag8 = Tag.new({'type' => 'Groceries'})
tag8.save()

tag9 = Tag.new({'type' => 'Holiday'})
tag9.save()

tag10 = Tag.new({'type' => 'Personal Care'})
tag10.save()

tag11 = Tag.new({'type' => 'Shopping'})
tag11.save()

tag12 = Tag.new({'type' => 'Transport'})
tag12.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save()







binding.pry
nil
