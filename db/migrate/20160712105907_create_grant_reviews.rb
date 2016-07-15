class CreateGrantReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :grant_reviews do |t|
      t.string :file

      t.integer :grant_detail_id

      t.timestamps
    end
  end
end
