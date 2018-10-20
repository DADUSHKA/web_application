class AddUsersMailNullConstraintPasswordNullConstraintNameNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :name, false)
  end
end