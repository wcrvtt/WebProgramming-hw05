class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :subject
      t.float :score

      t.timestamps
    end
  end
end
