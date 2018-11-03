class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :email
      t.date :fecnac
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
