class AgregarColumComments < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :comments, :users
    add_foreign_key :comments, :events
  end
end
