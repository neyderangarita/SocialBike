class CreateProfiels < ActiveRecord::Migration[5.0]
  def change
    create_table :profiels do |t|
      t.string :nombre
      t.string :email
      t.date :fecnac
      t.string :ocupacion
      t.string :fecreg
      t.boolean :acepto
      t.timestamps
    end
  end
end
