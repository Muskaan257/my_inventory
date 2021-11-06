class User < ActiveRecord::Base
    include GlobalID::Identification
    has_one :inventory

    has_secure_password

    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) # atleast 8 characters long
        (?=.*\d) # atleast one number
        (?=.*[a-z]) # atleast one lowercase letter
        (?=.*[A-Z]) # atleast one uppercase letter
        (?=.*[[:^alnum:]]) # atleast one symbol
    /x

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    validates :password, format: { with: PASSWORD_REQUIREMENTS, message: "Make sure your password has atleast one number, lowercase and uppercase letter, one symbol and should have a minimum length of 8 characters." }
end
