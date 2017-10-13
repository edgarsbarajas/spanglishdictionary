class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :commentable, polymorphic: true, index: true, null: false
      t.string :text, null: false

      t.timestamps
    end
  end
end
