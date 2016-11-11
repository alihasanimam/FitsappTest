class AddColumnIsLastToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :is_last, :boolean, default: true
  end
end
