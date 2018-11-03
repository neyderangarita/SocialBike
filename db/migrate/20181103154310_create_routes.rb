class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :map
      t.datetime :time
      t.string :description

      t.timestamps
    end
  end
end
