class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receiver
      t.string :text
      t.integer :status
      t.timestamps :seen_at

      t.timestamps
    end
  end
end
