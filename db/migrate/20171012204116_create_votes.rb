class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :voteable, polymorphic: true, index: true, null: false
      t.integer    :value, null: false
      t.boolean    :upvote, null: false

      t.timestamps
    end
  end
end
