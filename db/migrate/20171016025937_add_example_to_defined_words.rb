class AddExampleToDefinedWords < ActiveRecord::Migration[5.1]
  def change
    add_column :defined_words, :example, :string
  end
end
