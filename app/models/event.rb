class Event < ApplicationRecord

has_and_belongs_to_many :users

has_many :comments

belongs_to :user

has_one :route, foreign_key: 'event_id'

end

