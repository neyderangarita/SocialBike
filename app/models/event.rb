class Event < ApplicationRecord

belongs_to :user

has_many :comments

has_many :assistants

has_one :route

end

