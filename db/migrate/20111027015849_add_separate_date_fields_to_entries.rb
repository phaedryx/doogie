# eh, sqlite doesn't do dates anyway
class AddSeparateDateFieldsToEntries < ActiveRecord::Migration
  def change
    change_table :entries do |entries|
      entries.remove :written_on
      entries.integer :year,  limit: 4
      entries.integer :month, limit: 2
      entries.integer :day,   limit: 2
    end
  end
end
