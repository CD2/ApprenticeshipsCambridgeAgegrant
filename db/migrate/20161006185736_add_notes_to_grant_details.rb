class AddNotesToGrantDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :grant_details, :notes, :text
  end
end
