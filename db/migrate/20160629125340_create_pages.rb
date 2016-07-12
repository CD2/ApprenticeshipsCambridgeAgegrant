class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|

      t.string :body
      t.string :name
      t.string :url_alias
      t.boolean :home
      t.timestamps
    end
  end
end
