class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.integer :hand_id
      t.integer :user_id

      t.timestamps
    end
  end
end
