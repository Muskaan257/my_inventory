class User < ActiveRecord::Base
    has_one :inventory
    # has_many :items, through: :inventories

    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
