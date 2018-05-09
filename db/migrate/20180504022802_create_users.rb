class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth

      t.timestamps#el timestamp es para ver un registro que fue lo que hiso el usuario. como un check.
      #con el comando rails g model hace el timestampsi sirve pero para proyectos grandes no
    end
  end
end
