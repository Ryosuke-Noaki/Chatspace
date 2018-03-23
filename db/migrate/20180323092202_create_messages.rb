class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :image, null: false, default: ""

      t.references :group, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
