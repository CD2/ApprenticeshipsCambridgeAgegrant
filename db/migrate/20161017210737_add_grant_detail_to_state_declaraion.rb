class AddGrantDetailToStateDeclaraion < ActiveRecord::Migration[5.0]
  def change
    add_column :state_declarations, :grant_detail_id, :integer
  end
end
