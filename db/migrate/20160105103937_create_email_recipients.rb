class CreateEmailRecipients < ActiveRecord::Migration
  def change
    create_table :email_recipients do |t|
      t.string :email
      t.string :subject
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
