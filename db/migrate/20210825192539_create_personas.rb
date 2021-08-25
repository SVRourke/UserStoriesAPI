class CreatePersonas < ActiveRecord::Migration[6.1]
  def change
    create_table :personas do |t|

      t.timestamps
    end
  end
end
