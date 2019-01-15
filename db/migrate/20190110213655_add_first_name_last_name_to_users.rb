class AddFirstNameLastNameToUsers < ActiveRecord::Migration[5.2]
  change_table :users do |t|
    t.remove :name
    t.string :first_name,  null: false, default: ''
    t.string :last_name, null: false, default: ''
  end
end
