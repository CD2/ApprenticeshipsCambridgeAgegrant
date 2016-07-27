class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :document
      t.integer :grant_review_id
      t.timestamps
    end
  end
end
