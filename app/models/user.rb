class User < ApplicationRecord
    has_secure_password
    
    has_many :created_events, :class_name => "Event", :foreign_key => "user_id"
    
    has_many :comments
    
    has_many :assistants
    
    has_and_belongs_to_many :events
    
end
