class CreateClaims < ActiveRecord::Migration[6.1]
  def change
    create_table :claims do |t|
      t.string :title
      t.string :content
      t.integer :like
      t.integer :parent_id
      t.integer :user_id

      t.timestamps
    end
  end
end
