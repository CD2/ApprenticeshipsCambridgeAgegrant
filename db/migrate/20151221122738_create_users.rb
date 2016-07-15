class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :password_digest

      # Cookie
      t.string :remember_digest

      # Account Activation
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at

      # Password Reset
      t.string :reset_digest
      t.datetime :reset_sent_at

      # Different types of user
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
