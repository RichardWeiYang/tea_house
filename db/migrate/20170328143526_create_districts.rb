class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.timestamps
    end

    add_column :homes, :district_id, :integer
    add_index :homes, :district_id
  end
end
