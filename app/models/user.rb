class User < ApplicationRecord
    has_secure_password
    
    has_many :books
    
    has_many :comments
    
    has_many :events
    
    has_many :assistants
    
end
