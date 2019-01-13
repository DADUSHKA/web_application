class AddFirstNameLastNameToUsers < ActiveRecord::Migration[5.2]
  def change_column :users do |t|
      t.string :first_name,  null: false, default: ''
      t.string :last_name, null: false, default: ''
    end
    remove_column(:users, :name)
  end
end
