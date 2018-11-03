class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :nombre
      t.text :sitio_encuentro
      t.datetime :fecha

      t.timestamps
    end
  end
end
