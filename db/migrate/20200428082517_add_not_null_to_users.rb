class AddNotNullToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false
    change_column_default :users, :name, from: nil, to: ''

    change_column_null :users, :email, false
    change_column_default :users, :email, from: nil, to: ''

    change_column_null :users, :password_digest, false
    change_column_default :users, :password_digest, from: nil, to: ''
  end
end
