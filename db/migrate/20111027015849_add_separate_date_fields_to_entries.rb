# eh, sqlite doesn't do dates anyway
class AddSeparateDateFieldsToEntries < ActiveRecord::Migration
  def change
    change_table :entries do |entries|
      entries.remove :written_on
      entries.integer :year
      entries.integer :month
      entries.integer :day
    end
  end
end
