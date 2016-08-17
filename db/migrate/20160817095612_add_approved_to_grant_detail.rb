class AddApprovedToGrantDetail < ActiveRecord::Migration[5.0]
  def change

    add_column :grant_details, :approved, :boolean, default: false

  end
end
