class CreateEventsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :events_users do |t|
      t.references :events, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
