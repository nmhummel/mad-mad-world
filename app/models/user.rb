class User < ActiveRecord::Base
    has_many :starwars
    has_secure_password # ActiveRecord method (predefined)
    # provides a reader/writer method for password
    validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
    validates :email, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
end
