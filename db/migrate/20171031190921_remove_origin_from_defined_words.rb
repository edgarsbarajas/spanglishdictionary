class RemoveOriginFromDefinedWords < ActiveRecord::Migration[5.1]
  def change
    remove_column :defined_words, :origin_id
  end
end
