class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :nombre
      t.text :sitio_encuentro
      t.datetime :fecha
      
      t.references :user, foreign_key: true

      t.timestamps
    end
    
    create_table :events_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
    end
    
    
  end
end
