class CreateDefinedWords < ActiveRecord::Migration[5.1]
  def change
    create_table :defined_words do |t|
      t.string     :word, null: false
      t.string     :definition, null: false
      t.references :user, null: false
      t.references :origin, null: false

      t.timestamps
    end
  end
end
