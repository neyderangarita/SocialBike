class ModificarForeingKey < ActiveRecord::Migration[5.0]
  def change
    
    remove_foreign_key :comments, :users
    remove_foreign_key :comments, :events
    
    add_foreign_key :users, :comments
    add_foreign_key :events, :comments
    
  end
end
