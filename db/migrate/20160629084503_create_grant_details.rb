class CreateGrantDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :grant_details do |t|
      t.string :forename 
      t.string :surname
      t.string :email
      t.string :work_number
      t.string :mobile_number

      t.string :company_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :town_name
      t.string :county
      t.string :postcode

      t.string :learner_name
      t.string :learner_dob
      t.string :apprentice_start_date
      t.integer :training_provider

      t.string :bank_name
      t.string :account_number
      t.string :sort_code

      t.string :signature

      t.integer :user_id

      t.integer :title

      t.timestamps
    end
  end
end
