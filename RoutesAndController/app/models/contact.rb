class Contact < ActiveRecord::Base
  #user id is the owner of the contact
  validates :user_id, :email, :name, presence: true
  validates :user_id, :uniqueness => {:scope => :email}

  belongs_to :user

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user
end
