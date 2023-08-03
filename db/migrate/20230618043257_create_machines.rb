class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :machine_name, null: false
      t.integer :electricity, null: false

      t.timestamps
    end
  end
end
