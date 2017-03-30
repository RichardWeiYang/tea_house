class CreateEventdateships < ActiveRecord::Migration[5.0]
  def change
    create_table :eventdateships do |t|
      t.integer :home_id
      t.integer :eventdate_id
      t.timestamps
    end
  end
end
