class Event < ApplicationRecord

belongs_to :user

has_many :comments

has_many :assistants

belongs_to :route

end

