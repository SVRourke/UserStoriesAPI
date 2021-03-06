class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
