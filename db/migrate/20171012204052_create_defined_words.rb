class CreateDefinedWords < ActiveRecord::Migration[5.1]
  def change
    create_table :defined_words do |t|

      t.timestamps
    end
  end
end
