class CreateEventUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :events_users do |t|
      t.references :event, forgein_key: true
      t.references :user, forgein_key: true
      t.timestamps
    end
  end
end
