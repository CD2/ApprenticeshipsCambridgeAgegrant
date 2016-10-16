class CreateStateDeclarations < ActiveRecord::Migration[5.0]
  def change
    create_table :state_declarations do |t|
      t.integer :user_id
      t.integer :declaration

      t.timestamps
    end
  end
end
