class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :content
      t.boolean :complete
      t.belongs_to :epic

      t.timestamps
    end
  end
end
