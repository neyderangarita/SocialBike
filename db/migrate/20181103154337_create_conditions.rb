class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
