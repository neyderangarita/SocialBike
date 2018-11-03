class User < ApplicationRecord
    has_secure_password
    
    has_many :books
    
    has_many :comments
    
    has_many :assistants
    
    has_and_belongs_to_many :events
    
end
