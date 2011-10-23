class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :written_on
      t.text :content
      t.timestamps
    end
  end
end
