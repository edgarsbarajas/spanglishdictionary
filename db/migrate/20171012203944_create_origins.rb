class CreateOrigins < ActiveRecord::Migration[5.1]
  def change
    create_table :origins do |t|
      t.string :country, unique: true, null: false

      t.timestamps
    end
  end
end
