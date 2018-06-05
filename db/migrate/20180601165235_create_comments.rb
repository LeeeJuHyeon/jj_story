class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      #t.integer :user_id
      t.belongs_to :post
      t.text :content

      t.timestamps
    end
    #add_index :comments, user_id
  end
end
