# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date :date
      t.text :work_performed

      t.timestamps
    end
  end
end
