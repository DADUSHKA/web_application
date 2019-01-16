class AddFirstNameLastNameToUsers < ActiveRecord::Migration[5.2]
<<<<<<< HEAD
  change_table :users do |t|
    t.remove :name
    t.string :first_name, null: false, default: ''
=======
   change_table :users do |t|
    t.remove :name
    t.string :first_name,  null: false, default: ''
>>>>>>> 640d3a81526d49f7341d7b0697b8151dab07e8a4
    t.string :last_name, null: false, default: ''
  end
end
