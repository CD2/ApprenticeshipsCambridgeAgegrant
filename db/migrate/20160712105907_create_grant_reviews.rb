class CreateGrantReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :grant_reviews do |t|
      t.string :file

      t.timestamps
    end
  end
end
