class CreateAssistants < ActiveRecord::Migration[5.0]
  def change
    create_table :assistants do |t|
      t.boolean :asiste
      t.datetime :fecha

      t.timestamps
    end
  end
end
