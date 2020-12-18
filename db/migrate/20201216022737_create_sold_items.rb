class CreateSoldItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sold_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
