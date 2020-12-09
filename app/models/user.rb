class User < ActiveRecord::Base
    has_many :starwars
    has_secure_password # ActiveRecord method (predefined)
    # provides a reader/writer method for password
end
