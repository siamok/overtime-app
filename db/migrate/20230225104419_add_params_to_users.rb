class AddParamsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ssn, :integer
    add_column :users, :company, :string
  end
end
