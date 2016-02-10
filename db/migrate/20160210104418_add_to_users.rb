class AddToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :open_id, null: false, default: ''
    end

    add_index :users, :open_id, unique: true
  end
end
