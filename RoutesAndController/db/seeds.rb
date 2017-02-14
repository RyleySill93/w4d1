# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create(username: 'ryleysill')
  user2 = User.create(username: 'johnlee')

  Contact.destroy_all
  contact1 = Contact.create(email: 'stevejobs@gmail.com', name: 'Steve Jobs', user_id: user1.id)
  contact2 = Contact.create(email: 'billgates@gmail.com', name: 'Bill Gates', user_id: user2.id)
  contact3 = Contact.create(email: 'MarkAndressen@gmail.com', name: 'Mark Andreesen', user_id: user1.id)
  contact4 = Contact.create(email: 'kobe@gmail.com', name: 'Kobe', user_id: user2.id)

  ContactShare.destroy_all
  contactshare1 = ContactShare.create(user_id: user2.id, contact_id: contact1.id)
  contactshare2 = ContactShare.create(user_id: user1.id, contact_id: contact2.id)
end
