class AddBankAddressAndTradeSupplierTypeToGrantDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :grant_details, :bank_address, :text
    add_column :grant_details, :trade_supplier_type, :string
    add_column :grant_details, :account_name, :string
  end
end
